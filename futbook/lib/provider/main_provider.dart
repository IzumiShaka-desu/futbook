import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  MainProvider._internal();
  static final _singleton = MainProvider._internal();
  factory MainProvider() => _singleton;
}
