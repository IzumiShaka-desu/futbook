import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futbook/provider/auth_provider.dart';
import 'package:futbook/provider/main_provider.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext {
  pushTo(Widget to) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (ctx) => to));
  }

  replaceTo(Widget to) {
    return Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => to));
  }

  pop({dynamic data}) {
    return Navigator.of(this).pop(data);
  }

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get sizeOf => MediaQuery.of(this).size;

  showSnackbar(String? msg) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Container(
          color: Colors.black54,
          child: Row(
            children: [
              Text(
                msg ?? "",
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AuthProvider get authProvider => Provider.of<AuthProvider>(this);

  MainProvider get mainProvider => Provider.of<MainProvider>(this);
}
