import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  // Use chaves para definir parâmetros nomeados
  Debouncer({required this.milliseconds});

  void call(Function action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      action();
    });
  }
}
