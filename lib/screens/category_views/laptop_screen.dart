import 'package:ecommerce_app/models/my_products.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/widgets/product_card.dart';

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({super.key});

  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  @override
  Widget build(BuildContext context) {
    final laptops = MyProducts.laptopList;
    double h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(IconlyLight.arrow_left_2),
        ),
        elevation: 0,
        title: const Text(
          'Laptops',
          style: TextStyle(
              fontFamily: 'Tektur',
              fontSize: 25.0,
            
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
          itemCount: laptops.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: h * 0.27, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProductCard(
              productDetails: laptops[index],
            );
          }),
    );
  }
}
