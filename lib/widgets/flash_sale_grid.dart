import 'package:ecommerce_app/models/my_products.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FlashSaleGrid extends StatelessWidget {
  FlashSaleGrid({super.key});

  final saleProducts = MyProducts.saleProducts;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: saleProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: h * 0.27),
        itemBuilder: (context, index) {
          return ProductCard(productDetails: saleProducts[index]);
        });
  }
}
