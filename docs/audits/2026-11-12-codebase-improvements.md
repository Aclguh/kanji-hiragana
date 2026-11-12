# 漢字仮名 (Kanji-Hiragana) 架构与代码质量评估与提升规划 (IMPROVEMENTS.md)

> 文档性质: 临时项目健康度体检与技术质量改进推进表 (已在 .gitignore 中排除)。
> 本文档用于协调阶段性重构与代码健壮性加固。每个任务均对应一个原子 Git 提交。
> 全部落地完成后，本文档将归档至 docs/audits/ 或清理。

---

## 目录

- [一、项目现状与整体架构评估](#一项目现状与整体架构评估)
  - [1. 架构定位与模块拓扑](#1-架构定位与模块拓扑)
  - [2. 核心技术指标与现状概览](#2-核心技术指标与现状概览)
  - [3. 优势与工程亮点](#3-优势与工程亮点)
- [二、全维度问题清单与根因分析](#二全维度问题清单与根因分析)
  - [1. 架构设计 (Architecture Design)](#1-架构设计-architecture-design)
  - [2. 性能与响应度 (Performance)](#2-性能与响应度-performance)
  - [3. 安全性与沙箱防御 (Security)](#3-安全性与沙箱防御-security)
  - [4. 代码质量与稳健性 (Code Quality)](#4-代码质量与稳健性-code-quality)
  - [5. 可维护性与工程化 (Maintainability)](#5-可维护性与工程化-maintainability)
  - [6. 测试覆盖与质量工程 (Testing & QA)](#6-测试覆盖与质量工程-testing--qa)
- [三、改进方案与落地路径](#三改进方案与落地路径)
  - [P1 级: 架构核心解耦与安全防御加固](#p1-级架构核心解耦与安全防御加固)
  - [P2 级: 运行时稳健性、异常可观测性与容错降级](#p2-级运行时稳健性异常可观测性与容错降级)
  - [P3 级: 测试覆盖深化与交互边界断言加固](#p3-级测试覆盖深化与交互边界断言加固)
- [四、实施优先级与推进清单](#四实施优先级与推进清单)

---

## 一、项目现状与整体架构评估

### 1. 架构定位与模块拓扑

```
+-------------------------------------------------------------+
|                     Presentation Layer                      |
| (HomePage, HomeCoordinator, SingleKanjiView, SlidingDrawer) |
+------------------------------+------------------------------+
                               | (ChangeNotifier, Scopes)
                               v
+-------------------------------------------------------------+
|                        Domain Layer                         |
|  (Morpheme, JapaneseAnalyzer, KanjiFilter, KanjiConverter)  |
+------------------------------+------------------------------+
                               | (Services & Adapters)
                               v
+-------------------------------------------------------------+
|                    Infrastructure Layer                     |
|  (KuromojiEngine Isolate, PlatformService, TtsService,      |
|   QueryStore / SharedPreferences, DiagnosticsLog)           |
+-------------------------------------------------------------+
```

### 2. 核心技术指标与现状概览

| 评估维度 | 评级 / 得分 (满分 5.0) | 核心现状与风险分析 |
| :--- | :---: | :--- |
| **架构设计 (Architecture)** | 4.8 / 5.0 | 分层严密清晰，单例状态管理严格，分词与字典计算隔离在后台 Isolate 中。 |
| **性能与响应度 (Performance)** | 4.9 / 5.0 | 分词计算与词典构建在独立后台 Isolate 运行；输入防抖与分词结果按需更新。 |
| **安全性与沙箱防御 (Security)** | 4.8 / 5.0 | 零网络权限，严格清洗 Unicode 控制字符与 Bidi 字符；TSV 导出含基础公式防注入。 |
| **代码质量 (Code Quality)** | 4.8 / 5.0 | 静态分析零警告，零 print 调试代码；强类型与不可空设计健全。 |
| **可维护性 (Maintainability)** | 4.9 / 5.0 | 密封类 AppStrings 强制多语言编译期完整映射，支持 zh/en/ja；依赖锁严格审计。 |
| **测试覆盖 (Testing)** | 4.8 / 5.0 | 215 项单元与组件测试通过，198 项纯 Dart 逻辑断言全绿，全仓行覆盖率 90.86%。 |

- **静态代码分析基线**: 0 errors, 0 warnings (门禁要求: 新修改文件 0 告警，全仓告警数 <= 0)
- **单元测试通过率**: 100% Pass (215 / 215 tests passed, 2 skipped)
- **业务代码行覆盖率**: 90.86% (Hits: 4255 / Total: 4683)
- **纯 Dart 逻辑验证断言数**: 198 assertions passed

### 3. 优势与工程亮点

1. **分词 Isolate 隔离与故障自愈**: 将 kuromoji 分词引擎完全托管于独立 Isolate，具备看门狗超时机制、退出侦听与自动重启恢复机制。
2. **多语言编译期强约束**: 采用 Dart sealed class 实现 AppStrings，ZhStrings / EnStrings / JaStrings 漏译任意字段均会触发编译失败，避免运行时漏翻。
3. **敏感信息自动脱敏诊断系统**: DiagnosticsLog 采用环形缓冲与内存常驻，导出时对 CJK 文本和引号内字符自动做正则脱敏，兼顾排查便利与用户隐私。
4. **依赖供应链安全门禁**: 通过 tool/audit_deps.dart 校验所有三方依赖的官方 pub.dev 托管源与 64 位 sha256 摘要。

---

## 二、全维度问题清单与根因分析

### 1. 架构设计 (Architecture Design)
- **现状**: 架构分层规范，无上帝类或交叉依赖。
- **优化点**: `TtsService` 内部多次重复状态复位逻辑，需抽取收敛。

### 2. 性能与响应度 (Performance)
- **现状**: 性能优异，后台 Isolate 计算与按需局部构建结合良好。

### 3. 安全性与沙箱防御 (Security)
- **问题 S1 (Anki 导出末尾字段未转义)**: `lib/widgets/anki_export_sheet.dart` 中单汉字备注 `$note` 与多字短语收藏标记 `s.ankiTagFavorite` 直接拼接进入 TSV 字符串，未经过 `AnalysisResult.escapeTsvField()` 处理，与 `morpheme.dart` 的转义防护规范存在不一致。

### 4. 代码质量与稳健性 (Code Quality)
- **问题 Q1 (TtsService 异常未留存现场)**: `lib/core/tts_service.dart` 的 `isAvailable()`、`speak()` 与 `stop()` 使用裸 `catch (_)` 吞掉异常，当 Android 系统原生语音引擎调用失败时，诊断日志中无记录，丢失调试现场。
- **问题 Q2 (PlatformService 初始化异常未留存现场)**: `lib/core/platform_service.dart` 的 `getInitialProcessedText()` 针对非 MissingPluginException 的系统异常吞没，未记录到 `DiagnosticsLog`。

### 5. 可维护性与工程化 (Maintainability)
- **现状**: 架构规范和依赖审计齐备，文档规范严格执行。

### 6. 测试覆盖与质量工程 (Testing & QA)
- **问题 T1 (搜索输入框剪贴板与键盘提交覆盖盲区)**: `lib/widgets/home/home_search_input.dart` 行覆盖率仅 63.64%，空态下的剪贴板粘贴按钮逻辑 (清洗、超长截断提示) 以及软键盘 `TextInputAction.search` 回车提交在组件测试中缺乏覆盖。

---

## 三、改进方案与落地路径

### P1 级: 架构核心解耦与安全防御加固
- **OPT-01: Anki 导出 TSV 字段转义与防注入全面加固**
  - **涉及文件**: `lib/widgets/anki_export_sheet.dart`, `test/export_sheet_test.dart`
  - **方案**: 对拼接进 TSV 的 `note` 及 `ankiTagFavorite` 全量增加 `AnalysisResult.escapeTsvField` 转义，并在导出组件测试中增加防御性断言。
  - **预期收益**: 消除 TSV 格式污染与公式注入盲区，保持与领域模型导出规范一致。

### P2 级: 运行时稳健性、异常可观测性与容错降级
- **OPT-02: TtsService 平台异常捕获留痕与状态复位重构**
  - **涉及文件**: `lib/core/tts_service.dart`, `test/platform_test.dart`
  - **方案**: 接入 `DiagnosticsLog.instance.record('tts', e, stackTrace: stackTrace)`，抽取 `_resetCurrentUtterance()` 消除重复代码。
  - **预期收益**: 提升原生语音合成引擎异常时的可观测性与诊断能力，消除重复样板代码。

- **OPT-03: PlatformService 平台文本交互异常诊断记录**
  - **涉及文件**: `lib/core/platform_service.dart`, `test/platform_test.dart`
  - **方案**: 在 `getInitialProcessedText()` 捕获异常时，记录非 MissingPluginException 异常至 `DiagnosticsLog`。
  - **预期收益**: 便于诊断冷启动划词交互异常。

### P3 级: 测试覆盖深化与交互边界断言加固
- **OPT-04: HomeSearchInput 剪贴板粘贴与键盘提交测试补齐**
  - **涉及文件**: `test/home_page_test.dart`
  - **方案**: 在 `home_page_test.dart` 中增加模拟剪贴板文本粘贴、超长清洗提示与键盘搜索动作提交用例。
  - **预期收益**: 提升 `home_search_input.dart` 行覆盖率，确保剪贴板粘贴核心交互不回归。

---

## 四、实施优先级与推进清单

| 优先级 | 任务标识 | 任务名称 | 核心收益 | 涉及文件 | 状态 |
| :---: | :---: | :--- | :--- | :--- | :---: |
| **P1** | **OPT-01** | Anki 导出 TSV 字段转义与防注入全面加固 | 彻底规避 TSV 结构破坏与公式注入风险 | `lib/widgets/anki_export_sheet.dart`, `test/export_sheet_test.dart` | [x] |
| **P2** | **OPT-02** | TtsService 平台异常捕获留痕与状态复位重构 | 提高语音引擎异常可观测性并消除样板代码 | `lib/core/tts_service.dart`, `test/platform_test.dart` | [x] |
| **P2** | **OPT-03** | PlatformService 平台文本交互异常诊断记录 | 捕获冷启动划词平台交互异常现场 | `lib/core/platform_service.dart`, `test/platform_test.dart` | [x] |
| **P3** | **OPT-04** | HomeSearchInput 剪贴板粘贴与键盘提交测试补齐 | 提升输入组件测试覆盖率至 90%+ | `test/home_page_test.dart` | [x] |
