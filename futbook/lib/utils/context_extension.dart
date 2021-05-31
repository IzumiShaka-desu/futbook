import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futbook/constant/color_palette.dart';
import 'package:futbook/provider/auth_provider.dart';
import 'package:futbook/provider/main_provider.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext {
  pushTo(Widget to) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (ctx) => to));
  }

  pop({dynamic data}) {
    return Navigator.of(this).pop(data);
  }

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

  getAuthProvider() {
    return Provider.of<AuthProvider>(this);
  }

  getMainProvider() {
    return Provider.of<MainProvider>(this);
  }
}
