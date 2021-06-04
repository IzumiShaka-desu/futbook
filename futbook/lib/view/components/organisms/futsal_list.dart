import 'package:flutter/material.dart';
import 'package:futbook/view/components/molecules/futsal_container.dart';

class FutsalList extends StatelessWidget {
  const FutsalList({Key? key, required this.futsal}) : super(key: key);
  final List futsal;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: futsal.length,
          itemBuilder: (ctx, index) {
            return FutsalContainer(
                imageUrl:
                    "https://raw.githubusercontent.com/IzumiShaka-desu/gif_host/main/izu.jpg");
          }),
    );
  }
}
