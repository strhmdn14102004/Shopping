import 'package:ecommerce_app/models/my_products.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/widgets/product_card.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    final audio = MyProducts.audioList;

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(IconlyLight.arrow_left_2),
        ),
        elevation: 0,
        title: const Text(
          'Audio',
          style: TextStyle(
              fontFamily: 'Tektur',
              fontSize: 25.0,
             
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
          itemCount: audio.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: h * 0.27, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProductCard(
              productDetails: audio[index],
            );
          }),
    );
  }
}
