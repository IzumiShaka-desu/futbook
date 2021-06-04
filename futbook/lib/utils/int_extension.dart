import 'dart:async';

extension intextension on int {
  Timer delayMethod(Function() function) {
    return Timer(Duration(milliseconds: this), function);
  }

  String get currencyString => _toCurrencies();
  String _toCurrencies() {
    var chars = this.toString().split('').reversed.toList();
    int length = chars.length;
    List<String> res = [];
    print(chars);
    for (int i = 0; i < length; i++) {
      if (i == length - 1 || (i % 3) != 0 || i == 0) {
        res.add(chars[i]);
      } else {
        res.add(chars[i] + ".");
      }
    }
    return res.reversed.join();
  }
}
