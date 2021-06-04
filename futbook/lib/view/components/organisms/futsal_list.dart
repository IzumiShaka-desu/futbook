import 'package:flutter/material.dart';
import 'package:futbook/data/model/futsal.dart';
import 'package:futbook/view/components/molecules/futsal_container.dart';

class FutsalList extends StatelessWidget {
  const FutsalList({Key? key, required this.futsal}) : super(key: key);
  final List<Futsal> futsal;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: futsal.length,
          itemBuilder: (ctx, index) {
            return FutsalContainer(
              imageUrl: futsal[index].urlOfImage,
              name: futsal[index].name ?? "",
              price: futsal[index].price ?? "",
            );
          }),
    );
  }
}
