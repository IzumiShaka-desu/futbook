import 'package:flutter/material.dart';

extension DoubleExtension on double {
  Widget get starRate => _createStar();
  Widget _createStar() {
    int full = 5;
    int rate = (this * full).floor();
    var res = <Widget>[];
    for (var i = 0; i < full; i++) {
      if (i < rate) {
        res.add(Icon(
          Icons.star,
          color: Colors.yellow[400],
        ));
      } else {
        res.add(Icon(
          Icons.star,
          color: Colors.black87,
        ));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: res,
    );
  }
}
