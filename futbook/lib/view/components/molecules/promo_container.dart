import 'package:flutter/material.dart';
import 'package:futbook/view/components/atoms/image_container_network.dart';

class PromoContainer extends StatelessWidget {
  final String imageUrl;
  final String titleText;
  const PromoContainer(
      {Key? key, required this.imageUrl, required this.titleText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageContainerNetwork(
            imageUrl: imageUrl,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(titleText),
          ),
        )
      ],
    );
  }
}
