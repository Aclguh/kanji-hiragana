import 'package:kuromoji/kuromoji.dart';
// kuromoji 上游未在顶级入口 export 'src/tokenizer.dart'，
// 故在此统一做边界封装隔离，防止 implementation_imports 泄露至分词调度业务逻辑。
// ignore: implementation_imports
import 'package:kuromoji/src/tokenizer.dart';

/// 对 kuromoji 词法分析器的隔离封装与生命周期管理。
class KuromojiEngine {
  Tokenizer? _tokenizer;

  /// 词典模型是否已完成初始化构建。
  bool get isInitialized => _tokenizer != null;

  /// 初始化并构建词典模型。
  Future<void> build() async {
    _tokenizer ??= await TokenizerBuilder().build();
  }

  /// 执行底层词法切分。若尚未初始化则抛出 [StateError]。
  List<Map<String, dynamic>> tokenize(String text) {
    final tokenizer = _tokenizer;
    if (tokenizer == null) {
      throw StateError('KuromojiEngine 尚未初始化，请先调用 build()');
    }
    return tokenizer.tokenize(text);
  }
}
