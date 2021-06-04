import 'package:flutter/material.dart';
import 'package:futbook/data/model/futsal.dart';
import 'package:futbook/provider/main_provider.dart';
import 'package:futbook/view/components/organisms/futsal_list.dart';
import 'package:futbook/view/components/organisms/recommend_carousel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      drawer: Drawer(
        child: Column(
          children: [DrawerHeader(child: CircleAvatar())],
        ),
      ),
      body: Column(
        children: [
          RecommendedCarousel(
            img: [
              "https://raw.githubusercontent.com/IzumiShaka-desu/gif_host/main/img/ikl.jpg",
              "https://raw.githubusercontent.com/IzumiShaka-desu/gif_host/main/img/ikl2.jpg",
              "https://raw.githubusercontent.com/IzumiShaka-desu/gif_host/main/img/ikl.jpg",
              "https://raw.githubusercontent.com/IzumiShaka-desu/gif_host/main/img/ikl2.jpg"
            ],
          ),
          Expanded(
              child: Consumer<MainProvider>(
            builder: (ctx, prov, _) => FutsalList(
              futsal: Futsal.dummies,
            ),
          ))
        ],
      ),
    );
  }
}
