import 'package:flutter/material.dart';
import 'package:futbook/constant/color_palette.dart';
import 'package:futbook/view/components/atoms/image_container_network.dart';
import 'package:get/get.dart';

class FutsalContainer extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  const FutsalContainer(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: ImageContainerNetwork(
              imageUrl: imageUrl,
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '$name',
                        style: Get.textTheme.headline5!.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      Text('karawang'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_border_outlined,
                        color: ColorPallete.starIconColor,
                      ),
                      Text('4.5'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_sharp),
                      Text('$price'),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
