import 'dart:async';

import 'package:flutter/material.dart';
import 'package:futbook/constant/color_palette.dart';
import 'package:futbook/view/components/atoms/Logo.dart';
import 'package:futbook/utils/context_extension.dart';
import 'package:futbook/view/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    context.mainProvider.loadFutsalList();
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        animate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: context.sizeOf.width * 0.5,
                child: LogoWidget(),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Loading....."),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: context.sizeOf.width * 0.8,
                        height: 25,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: ColorPallete.secondary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 2000),
                              height: 20,
                              width: animate ? context.sizeOf.width * 0.76 : 0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: ColorPallete.activePrimaryColor,
                              ),
                              onEnd: () => context.replaceTo(MainScreen()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
