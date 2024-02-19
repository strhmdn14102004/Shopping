import 'package:ecommerce_app/models/my_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:iconly/iconly.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    final cameras = MyProducts.cameraList;
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
          'Camera',
          style: TextStyle(
              fontFamily: 'Tektur',
              fontSize: 25.0,
              
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
          itemCount: cameras.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: h * 0.27, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProductCard(
              productDetails: cameras[index],
            );
          }),
    );
  }
}
