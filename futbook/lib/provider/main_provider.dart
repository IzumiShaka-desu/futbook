import 'package:flutter/cupertino.dart';
import 'package:futbook/data/model/futsal.dart';

class MainProvider extends ChangeNotifier {
  MainProvider._internal();
  static final _singleton = MainProvider._internal();
  factory MainProvider() => _singleton;
  List<Futsal> _futsal = [];
  List<Futsal> get futsal => _futsal;
  void loadFutsalList() {}
}
