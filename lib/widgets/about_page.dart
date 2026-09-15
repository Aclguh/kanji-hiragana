import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

/// 关于页面: 版本号、仓库、许可与致谢。
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  /// 与 pubspec.yaml 保持一致。
  static const String version = '1.0.1';
  static const String buildNumber = '2';
  static const String repoUrl = 'https://github.com/Aclguh/kanji-hiragana';

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('关于')),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        thickness: 6,
        radius: const Radius.circular(3),
        child: ListView(
          controller: _scrollController,
          primary: false,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
          children: [
            _buildHeader(context),
            const SizedBox(height: 26),

            const _SectionLabel('版本'),
            const _InfoCard(
              rows: [
                _InfoRow('版本号', AboutPage.version),
                _InfoRow('构建号', AboutPage.buildNumber),
                _InfoRow('包名', 'com.kanjihiragana.kanji_hiragana'),
              ],
            ),
            const SizedBox(height: 22),

            const _SectionLabel('仓库'),
            _LinkTile(
              icon: Icons.code_rounded,
              title: 'GitHub',
              value: AboutPage.repoUrl,
              onTap: () => _copy(
                context,
                AboutPage.repoUrl,
                '已复制仓库地址',
              ),
            ),
            const SizedBox(height: 22),

            const _SectionLabel('许可'),
            const _InfoCard(
              rows: [
                _InfoRow('应用代码', 'MIT License'),
                _InfoRow(
                  'KANJIDIC2',
                  'CC BY-SA 4.0',
                  note: '音读 / 训读 / 释义 / 笔画 / 学年数据',
                ),
                _InfoRow(
                  'kuromoji · IPADIC',
                  'Apache License 2.0',
                  note: '分词与读音分析',
                ),
              ],
            ),
            const SizedBox(height: 22),

            const _SectionLabel('致谢'),
            const _ThanksCard(),
            const SizedBox(height: 26),

            Center(
              child: Text(
                '漢字仮名 ${AboutPage.version}',
                style: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 11,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _copy(BuildContext context, String text, String tip) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(tip),
        duration: const Duration(milliseconds: 1200),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = AppTheme.of(context);
    return Column(
      children: [
        Container(
          width: 78,
          height: 78,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: colors.border),
          ),
          child: Text(
            '漢',
            style: TextStyle(
              color: colors.textPrimary,
              fontSize: 42,
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          '漢字仮名',
          style: TextStyle(
            color: colors.textPrimary,
            fontSize: 21,
            fontWeight: FontWeight.w600,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '输入日语汉字，查看平假名与罗马音',
          style: TextStyle(color: colors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.of(context).textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _InfoRow {
  final String label;
  final String value;
  final String? note;

  const _InfoRow(this.label, this.value, {this.note});
}

class _InfoCard extends StatelessWidget {
  final List<_InfoRow> rows;

  const _InfoCard({required this.rows});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            if (i > 0)
              Divider(height: 1, color: colors.border, indent: 14),
            _buildRow(context, rows[i]),
          ],
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, _InfoRow row) {
    final colors = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              row.label,
              style: TextStyle(color: colors.textSecondary, fontSize: 13),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SelectableText(
                  row.value,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: colors.textPrimary,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                if (row.note != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    row.note!,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: colors.textSecondary,
                      fontSize: 10.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _LinkTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.border),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppTheme.accent),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: colors.textPrimary,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    style: TextStyle(
                      color: AppTheme.indigo,
                      fontSize: 11.5,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.copy_rounded,
                size: 17, color: colors.textSecondary),
          ],
        ),
      ),
    );
  }
}

class _ThanksCard extends StatelessWidget {
  const _ThanksCard();

  static const _items = <(String, String)>[
    ('kuromoji', '形态素分析引擎 (纯 Dart 实现)'),
    ('KANJIDIC2', '汉字音读、训读与释义数据'),
    ('Atilika IPADIC', '日语分词词典'),
    ('Flutter', '跨平台应用框架'),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < _items.length; i++) ...[
            if (i > 0) const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: AppTheme.accent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontSize: 12.5,
                        height: 1.45,
                      ),
                      children: [
                        TextSpan(
                          text: _items[i].$1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '  ${_items[i].$2}',
                          style: TextStyle(color: colors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 14),
          Divider(height: 1, color: colors.border),
          const SizedBox(height: 12),
          Text(
            '本应用完全离线运行，不收集任何数据，不请求任何权限。',
            style: TextStyle(
              color: colors.textSecondary,
              fontSize: 11.5,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
