import 'dart:async';
import 'dart:ui';

class DebaucerHelper {
  final int millisenconds;
  Timer? _timer;

  DebaucerHelper({
    required this.millisenconds,
  });

  void call(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: millisenconds), callback);
  }
}
