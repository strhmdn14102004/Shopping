import 'package:ecommerce_app/models/my_products.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/widgets/product_card.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    final games = MyProducts.gamesList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(IconlyLight.arrow_left_2),
        ),
        elevation: 0,
        title: const Text(
          'Smartphones',
          style: TextStyle(
              fontFamily: 'Tektur',
              fontSize: 25.0,
            
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
          itemCount: games.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: h * 0.27, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProductCard(
              productDetails: games[index],
            );
          }),
    );
  }
}
