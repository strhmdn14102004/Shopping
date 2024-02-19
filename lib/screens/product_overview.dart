import 'package:ecommerce_app/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../models/products.dart';

class ProductOverviewPage extends StatefulWidget {
  final Product product;
  const ProductOverviewPage({super.key, required this.product});

  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    CartPageController cartPageController = Get.put(CartPageController());
    RxString buttonMessage = 'Add to Cart'.obs;

    return Scaffold(
        appBar: AppBar(
           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(IconlyLight.arrow_left)),
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(IconlyLight.send))
          ],
        ),
        body: Column(
          children: [
            Container(
              height: h * 0.35,
             
              child: Center(child: Image.asset(widget.product.image)),
            ),
            Expanded(
              child: Container(
                height: h,
                width: w,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, right: 25.0, left: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.price,
                            style: const TextStyle(
                              fontSize: 17.5,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      const Text(
                        'Est ut non velit dolor est eiusmod tempor Lorem deserunt elit nostrud sit commodo. Pariatur irure exercitation occaecat cillum fugiat veniam mollit. Anim dolor nostrud magna non incididunt nostrud amet ullamco amet.',
                        maxLines: 4,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      SizedBox(height: h * 0.07),
                      InkWell(
                        onTap: () {
                          if (cartList.contains(widget.product)) {
                            cartPageController.removeProduct(widget.product);
                            Get.showSnackbar(const GetSnackBar(
                              message: 'Removed from Cart',
                              duration: Duration(milliseconds: 900),
                            ));
                          } else {
                            cartPageController.addProduct(widget.product);
                            Get.showSnackbar(const GetSnackBar(
                              message: 'Add to Cart',
                              duration: Duration(milliseconds: 900),
                            ));
                          }
                        },
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.0),
                              gradient: const LinearGradient(colors: [
                                Colors.teal,
                                Color.fromARGB(240, 12, 190, 148)
                              ]),
                            ),
                            height: h * 0.075,
                            width: w * 0.9,
                            child: Obx(
                              () => Center(
                                child: cartList.contains(widget.product)
                                    ? const Text(
                                        'Remove from Cart',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 19.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 19.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
