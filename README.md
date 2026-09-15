<div align="center">

<img src="docs/icon.png" width="120" alt="漢字仮名 图标" />

# 漢字仮名

**输入日语汉字，即时看到对应的平假名与罗马音。**

一个完全离线的 Flutter 安卓应用，像翻译软件那样逐词对照汉字、假名与罗马音，
输入单个汉字时还能查它的音读与训读。

[![Flutter](https://img.shields.io/badge/Flutter-3.47-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android)](#安装)
[![Release](https://img.shields.io/github/v/release/Aclguh/kanji-hiragana?label=Download)](https://github.com/Aclguh/kanji-hiragana/releases/latest)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

</div>

---

## 功能

- **汉字 → 平假名 → 罗马音** 逐词三列对照，基于形态素分析（kuromoji + IPADIC）
- **单汉字详解**：输入单个汉字时，列出该字的**音读**与**训读**，
  附罗马音、笔画数、学年、中文释义
- **两种视图可切换**
  - **对照表**：逐词并排三列（汉字 / 平假名 / 罗马音），带词性标签
  - **注音**：类似日语教材的振假名（Furigana），读音标在汉字上方
- **双轨读音**：标注用规范拼写，同时标出实际发音差异
  - 「東京」标注 `とうきょう`，发音注明 `とーきょー`
  - 助词「は」标注 `は`，注明读作 `わ`（朱红色突出，这正是要掌握的语法点）
- **汉字筛选**：按笔画数、使用频率、学年、读音构成筛选，可切换排序方式，
  全屏网格浏览结果并点入查看详解
- **设置**：主题切换（浅色 / 深色 / 跟随系统）、旋转屏幕开关、关于页
- 点按任意词复制原文，一键复制全文假名；罗马音可开关
- **聚焦式主界面**：打开时只有一个居中的输入框，输入后动画展开完整界面
- **完全离线**：词典随应用打包，无任何网络请求、无权限、无广告

## 截图

<div align="center">

| 空状态 | 对照表 |
| :---: | :---: |
| <img src="docs/screenshots/01-empty.png" width="260" alt="空状态：居中的输入框" /> | <img src="docs/screenshots/02-table.png" width="260" alt="对照表：汉字 / 平假名 / 罗马音三列" /> |
| 打开时只有一个居中的输入框 | 逐词三列对照，朱红高亮当前词，附词性标签 |

| 注音 | 单汉字详解 |
| :---: | :---: |
| <img src="docs/screenshots/03-furigana.png" width="260" alt="注音：振假名视图" /> | <img src="docs/screenshots/04-single-kanji.png" width="260" alt="单汉字：音读与训读" /> |
| 振假名排版，汉字上方标读音，下方标罗马音 | 输入单个汉字时给出音读、训读、释义、笔画与学年 |

| 设置 | 筛选 |
| :---: | :---: |
| <img src="docs/screenshots/05-settings-light.png" width="260" alt="设置抽屉：主题 / 旋转屏幕 / 关于" /> | <img src="docs/screenshots/07-filter.png" width="260" alt="筛选抽屉：按笔画、频率、学年筛选" /> |
| 右下角齿轮展开，可切换主题、开关旋转、进入关于页 | 左下角放大镜展开，按笔画 / 频率 / 学年查找汉字 |

| 筛选结果 | 关于 |
| :---: | :---: |
| <img src="docs/screenshots/08-filter-result.png" width="260" alt="全屏筛选结果网格" /> | <img src="docs/screenshots/09-about.png" width="260" alt="关于页：版本、仓库、许可与致谢" /> |
| 全屏网格浏览结果，内容超出一屏时有侧边滚动条 | 版本号、GitHub 仓库、开源许可与致谢 |

| 浅色主题 | 深色主题 |
| :---: | :---: |
| <img src="docs/screenshots/06-light-main.png" width="260" alt="浅色主题主界面" /> | <img src="docs/screenshots/10-dark-main.png" width="260" alt="深色主题主界面" /> |
| 浅色主题：米白纸感底 + 墨色文字 | 深色主题：同一界面自动换色，设置持久保存 |

</div>

## 安装

### 直接安装 APK

从 [Releases](https://github.com/Aclguh/kanji-hiragana/releases/latest) 下载对应架构的 APK：

| 文件 | 适用设备 | 大小 |
| --- | --- | --- |
| `app-arm64-v8a-release.apk` | 绝大多数现代手机（**推荐**） | 39.0 MB |
| `app-armeabi-v7a-release.apk` | 较老的 32 位设备 | 36.6 MB |
| `app-x86_64-release.apk` | 模拟器 / x86 平板 | 40.4 MB |

> 若不确定选哪个，装 `arm64-v8a`；装错了会提示「应用未安装」。

### 从源码构建

```bash
git clone https://github.com/Aclguh/kanji-hiragana.git
cd kanji-hiragana
flutter pub get
flutter build apk --release --split-per-abi
# 产物: build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
```

> 仓库不含签名密钥。未配置 `android/key.properties` 时，release 构建会自动
> 回落到 debug 签名（可正常安装使用，但不适合分发给他人）。
> 发布正式包时按官方文档在 `android/key.properties` 填入自己的密钥即可，
> 该文件与 `*.jks` 已被 `.gitignore` 排除。

## 使用

1. 打开应用，在居中的输入框里输入日语（汉字、假名、混合句子都行）
2. 输入内容后界面自动展开：
   - 输入**多个字** → 显示逐词对照表 / 注音视图
   - 输入**单个汉字** → 额外显示该字的音读、训读、释义等信息
3. 顶部可切换「对照表 / 注音」两种视图
4. 点按词条复制，或点右上角复制全文假名
5. 右下角齿轮按钮打开**设置**（主题 / 旋转屏幕 / 关于），
   左下角放大镜按钮打开**筛选**（按笔画、频率等条件查找汉字）

## 技术方案

| 环节 | 实现 |
| --- | --- |
| 分词与读音 | [`kuromoji`](https://pub.dev/packages/kuromoji)（Atilika IPADIC，纯 Dart 实现） |
| 音读 / 训读 | KANJIDIC2 离线提取的 2999 个常用汉字，见 `lib/core/kanji_reading_dict.dart` |
| 片假名 → 平假名 | 码位偏移转换（`0x30A1 - 0x3041`） |
| 平假名 → 罗马音 | 自实现改良式 Hepburn 拼写 |
| 设置持久化 | [`shared_preferences`](https://pub.dev/packages/shared_preferences) |
| 图标 | `CustomPainter` 手绘矢量路径（齿轮 / 放大镜），不依赖字体或 emoji |
| 状态与 UI | Flutter Material 3，浅色 / 深色两套和风主题 |

### 读音与发音的双轨策略

kuromoji 对同一个词给出两个不同的字段，用途不同：

| 字段 | 「東京」 | 「は」（助词） | 特性 |
| --- | --- | --- | --- |
| `reading`（读音） | トウキョウ | ハ | 规范假名拼写，适合标注 |
| `pronunciation`（发音） | トーキョー | ワ | 实际口语，长音用 `ー` 速记 |

**两个字段都用**：假名标注与罗马音取自 `reading`，保证拼写规范、学习者能查字典对上；
同时在词条下方另列 `pronunciation` 展示真实发音，并把助词音变
（は→わ、へ→え、を→お）用朱红突出。

如果只取 `pronunciation`，就会出现「東京 → とーきょー」这种查不到字典的拼写；
如果只取 `reading`，又会漏掉实际怎么读。双轨是唯一不丢信息的做法。

### 关于音读 / 训读

IPADIC 只给单个汉字一个最常用读音，**不区分音读与训读**，
因此这部分数据另行从 [KANJIDIC2](https://www.edrdg.org/wiki/index.php/KANJIDIC_Project)
提取（CC BY-SA 4.0），覆盖 2999 个教育 / 常用 / 人名用汉字，
含 `ja_on`（音读）与 `ja_kun`（训读）字段。

训读记法约定：

| KANJIDIC2 原记法 | 本应用显示 | 含义 |
| --- | --- | --- |
| `まな.ぶ` | `まな(ぶ)` | 点号是送假名分界 |
| `-び` / `び-` | `(び)` | 仅作词缀，不单独成词 |

界面显示罗马音时会自动剥除括号（`まな(ぶ)` → `manabu`）。

## 目录结构

```
lib/
  main.dart                  应用入口，启动时读取设置并后台预热词典
  theme.dart                 浅色 / 深色两套和风配色（AppColors ThemeExtension）
  home_page.dart             主页面：聚焦式输入框 + 视图切换 + 悬浮按钮
  core/
    kana_romaji.dart         假名 ↔ 罗马音转换（核心算法）
    morpheme.dart            词模型与解析结果模型（双轨读音）
    japanese_analyzer.dart   形态素分析服务（单例，离线）
    kanji_reading_dict.dart  [自动生成] 2999 汉字的音读 / 训读
    kanji_filter.dart        汉字筛选条件模型与匹配逻辑
    settings.dart            主题模式 / 旋转开关的持久化控制
  widgets/
    alignment_table.dart     三列对照表视图
    furigana_view.dart       振假名注音视图
    single_kanji_view.dart   单汉字音读 / 训读详解视图
    sliding_drawer.dart      侧边抽屉外壳（面板 + 压暗遮罩）
    settings_drawer.dart     设置抽屉内容
    filter_drawer.dart       筛选抽屉内容
    filter_result_page.dart  全屏筛选结果网格
    about_page.dart          关于页（版本 / 仓库 / 许可 / 致谢）
    vector_icon.dart         手绘矢量图标（齿轮 / 放大镜）
test/
  core_test.dart             单元测试
integration_test/
  ui_test.dart               真机 UI 测试
tool/
  verify.dart                独立验证脚本（54 项断言，dart run 即可跑）
  gen_kanji_dict.py          KANJIDIC2 → Dart 数据生成脚本
  gen_icon.py                应用图标生成脚本
  data/                      KANJIDIC2 原始数据（仅 .gz，约 1.5MB）
```

## 开发

```bash
flutter pub get

# 静态检查
flutter analyze

# 逻辑验证（不依赖 flutter_test，任何环境都能跑，54 项断言）
dart run tool/verify.dart

# 单元测试
flutter test

# 真机 UI 测试（需连接设备）
flutter test integration_test/ui_test.dart -d <device-id>

# USB 调试直连运行
flutter run -d <device-id> --release
```

### 重新生成数据文件

词典数据是构建时预生成的 Dart 源码，日常开发不需要重跑。
只在需要更新词典版本时执行：

```bash
# 1. 下载 KANJIDIC2（约 1.5MB gzip）
curl -L -o tool/data/kanjidic2.xml.gz \
  https://www.edrdg.org/kanjidic/kanjidic2.xml.gz

# 2. 生成 lib/core/kanji_reading_dict.dart
python tool/gen_kanji_dict.py
```

脚本直接读 `.gz`，会自动挑选其中的教育 / 常用 / 人名用汉字。
（解压后的 16MB XML 不必入库，已在 `.gitignore` 中排除。）

应用图标同样是生成出来的，改了设计后重跑：

```bash
python tool/gen_icon.py   # 输出到 android/app/src/main/res/
```

### 关于体积

`kuromoji` 的 IPADIC 词典以 gzip 压缩后内嵌为 Dart 源码（约 23MB 源文件），
是 APK 体积的主要来源。若需瘦身，**务必按 ABI 拆分**：

```bash
flutter build apk --release --split-per-abi
```

拆分后每个 APK 只含单一架构，体积可显著下降。

## 数据来源与许可

- **应用代码**：[MIT](LICENSE)
- **音读 / 训读**：[KANJIDIC2](https://www.edrdg.org/wiki/index.php/KANJIDIC_Project)，
  版权归 Electronic Dictionary Research and Development Group，
  以 [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) 发布。
  `lib/core/kanji_reading_dict.dart` 是其衍生作品，同样以 CC BY-SA 4.0 提供。
- **分词与读音**：[kuromoji](https://pub.dev/packages/kuromoji) 与
  [IPADIC](https://www.atilika.com)，Apache License 2.0。

## 致谢

- [kuromoji](https://github.com/takuyaa/kuromoji.js) —— 形态素分析的纯 Dart 移植
- [KANJIDIC2](https://www.edrdg.org/wiki/index.php/KANJIDIC_Project) —— 汉字读音与释义
- [Atilika](https://www.atilika.com) —— IPADIC 词典
