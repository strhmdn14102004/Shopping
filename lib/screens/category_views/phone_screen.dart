import 'package:ecommerce_app/models/my_products.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/widgets/product_card.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;

    final smartphones = MyProducts.phonesList;

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
          itemCount: smartphones.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: h * 0.27, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProductCard(
              productDetails: smartphones[index],
            );
          }),
    );
  }
}
