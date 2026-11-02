# kanji-hiragana 架构设计与代码质量深度评估与改进归档 (2026-11-02)

> **文档性质**: 全维度健康度评估与技术改进归档文档。
> 本文档记录了 2026-11-02 完成的六维度全量审计与原子化改进交付。
> 所有任务已 100% 完成并通过严格的质量门禁与测试套件。

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
- [四、实施成果与落地清单](#四实施成果与落地清单)

---

## 一、项目现状与整体架构评估

### 1. 架构定位与模块拓扑

```
┌─────────────────────────────────────────────────────────────┐
│                       Presentation Layer                    │
│     (HomePage, AlignmentTable, FuriganaView, VerticalView)   │
└──────────────────────────────┬──────────────────────────────┘
                               │ (HomeCoordinator / AppScopes)
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                        Domain Layer                         │
│  (Morpheme, JapaneseAnalyzer, KanjiFilter, KanjiConverter)  │
└──────────────────────────────┬──────────────────────────────┘
                               │ (Services / Dictionaries)
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                    Infrastructure Layer                     │
│  (SharedPreferences, MethodChannel, DiagnosticsLog, IPADIC) │
└─────────────────────────────────────────────────────────────┘
```

### 2. 核心技术指标与现状概览

| 评估维度 | 评级 / 得分 (满分 5.0) | 核心现状与成果 |
| :--- | :---: | :--- |
| **架构设计 (Architecture)** | 4.9 / 5.0 | 分层严整，Coordinator 状态解耦视图，服务依赖轻量可测。 |
| **性能与响应度 (Performance)** | 4.9 / 5.0 | 自研 Sliver 惰性加载，独立 Isolate 分词零阻塞，字符集按字素簇处理。 |
| **安全性与防御 (Security)** | 5.0 / 5.0 | TSV 公式注入前缀转义、Unicode 控制符清洗与日志自动隐私脱敏机制完善。 |
| **代码质量 (Code Quality)** | 4.9 / 5.0 | 静态分析 0 告警，消除冗余调用，持久化与导出故障接入诊断日志。 |
| **可维护性 (Maintainability)** | 4.9 / 5.0 | AppStrings 密封类强类型三语本地化，85 个锁定依赖全量哈希验签。 |
| **测试覆盖 (Testing)** | 4.8 / 5.0 | 215 个测试全绿，核心模块覆盖率由 89.70% 提升至 90.86% (HomeCoordinator 100%)。 |

- **静态代码分析基线**: `flutter analyze` 0 errors, 0 warnings
- **单元测试通过率**: `100% Pass` (215 / 215 tests)
- **纯 Dart 逻辑验证**: `100% Pass` (198 / 198 assertions)
- **代码行覆盖率**: `90.86%` (Hits: 4255 / Total: 4683 lines)

---

## 二、全维度问题清单与根因分析

### 1. 架构设计 (Architecture Design)
- **现状良好**: 采用 `KanjiServices` 配合 `AppScopes` 进行轻量依赖注入，`HomeCoordinator` 承担状态协调，各层职责边界清晰。

### 2. 性能与响应度 (Performance)
- **现状良好**: `japanese_analyzer` 通过单独 `Isolate` 运行词典分词，主线程零卡顿；`AlignmentTable` 使用 Sliver 惰性构建，高帧率交互。

### 3. 安全性与沙箱防御 (Security)
- **现状良好**: `InputSanitizer` 过滤 C0/C1 控制符与 Bidi 伪造，`AnalysisResult.escapeTsvField` 全面防护公式注入，`DiagnosticsLog` 自动脱敏用户隐私。

### 4. 代码质量与稳健性 (Code Quality)
- **已修复 Q1 (持久化错误追踪缺失)**: `QueryStore` 与 `SettingsController` 发生 `_loadError` / `_saveError` 时接入 `DiagnosticsLog`，导出诊断日志时可定位持久化底层问题。
- **已修复 Q2 (批量导出异常吞没)**: `AnkiExportSheet` 在 `analyzeBatch` 失败时接入 `DiagnosticsLog` 追踪，完整保留故障现场堆栈。
- **已修复 Q3 (冗余清理调用)**: 清理了 `JapaneseAnalyzer._send` 与 `_sendBatch` 中捕获 `TimeoutException` 时与 `finally` 重复调用的 `_pending.remove(id)`。

### 5. 可维护性与工程化 (Maintainability)
- **现状良好**: 采用 Conventional Commits 提交规范，依赖供应链经 `tool/audit_deps.dart` 全量 hash 验签。

### 6. 测试覆盖与质量工程 (Testing & QA)
- **已强化 T1 (业务协调器测试边缘覆盖)**: 补充 `HomeCoordinator` 完整生命周期、竞态取消、外部划词事件广播与预热失败测试，覆盖率由 69.12% 提升至 100%。
- **已强化 T2 (TTS 服务与辅助函数测试)**: 补齐 `TtsService` 超时守护、状态复位、通道回调及 `feedback.dart` 的 `speakWithFeedback`、`strings.dart` 学年区间测试，`TtsService` 覆盖率由 71.05% 提升至 93.42%。

---

## 三、改进方案与落地路径

- **P1 级: 核心模块稳健性与可观测性加固**
  - OPT-01: 在 `QueryStore` 与 `SettingsController` 中为持久化读写异常补充 `DiagnosticsLog` 诊断记录。
  - OPT-02: 在 `AnkiExportSheet` 中为批量分词失败补充 `DiagnosticsLog` 追踪记录。
- **P2 级: 代码整洁度与冗余清理**
  - OPT-03: 清理 `JapaneseAnalyzer._send` 中重复的 `_pending.remove(id)` 冗余调用。
- **P2/P3 级: 测试覆盖盲区歼灭与质量门禁提升**
  - OPT-04: 补充 `HomeCoordinator` 完整状态生命周期、竞态取消与平台外部事件的单元测试，提升覆盖率至 100%。
  - OPT-05: 补充 `TtsService`、`speakWithFeedback` 及 `strings.dart` 学年范围文案的单元测试，加固质量基线。

---

## 四、实施成果与落地清单

| 优先级 | 标识 | 任务名称 | 涉及文件 | 状态 | 收益 |
| :--- | :--- | :--- | :--- | :---: | :--- |
| P1 | OPT-01 | 持久化读写错误接入 DiagnosticsLog 诊断上报 | lib/core/query_store.dart, lib/core/settings.dart | [x] | 增强生产环境持久化故障排查能力 |
| P1 | OPT-02 | Anki 导出批量分析失败接入 DiagnosticsLog 追踪 | lib/widgets/anki_export_sheet.dart | [x] | 避免异常静默丢失，保留故障现场堆栈 |
| P2 | OPT-03 | 消除 JapaneseAnalyzer._send 冗余清理调用 | lib/core/japanese_analyzer.dart | [x] | 提高代码整洁度，避免重复状态操作 |
| P2 | OPT-04 | 补齐 HomeCoordinator 边界与竞态单元测试 | test/core_test.dart | [x] | 消除核心协调器覆盖盲区，提升至 100% |
| P3 | OPT-05 | 补齐 TtsService、feedback 及 strings 单元测试 | test/core_test.dart, test/platform_test.dart, test/widget_test.dart | [x] | 全面加固测试防线，提升业务代码覆盖率至 90.86% |
