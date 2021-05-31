import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider._internal();
  static final _singleton = AuthProvider._internal();
  factory AuthProvider() => _singleton;
}
