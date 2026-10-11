import 'dart:async';

/// 简易防抖器, 避免每次按键都触发形态素分析, 同时支持取消已飞行的异步任务。
class Debouncer {
  final Duration delay;
  Timer? _timer;
  int _activeId = 0;

  Debouncer(this.delay);

  /// 安排执行 [action]。如果在等待期或异步执行期间安排了新任务，旧任务的
  /// [isCancelled] 会返回 true，从而提早中止分词与状态更新。
  void run(Future<void> Function(bool Function() isCancelled) action) {
    _timer?.cancel();
    final id = ++_activeId;
    _timer = Timer(delay, () {
      if (id != _activeId) return;
      action(() => id != _activeId);
    });
  }

  /// 取消当前等待中与飞行中的任务。
  void cancel() {
    _timer?.cancel();
    _activeId++;
  }

  void dispose() => cancel();
}
