import 'package:ecommerce_app/common/cart_controller.dart';
import 'package:ecommerce_app/services/cart_service.dart';
import 'package:ecommerce_app/widgets/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Keranjang',
          style: TextStyle(
              fontFamily: 'Tektur',
              color: Colors.teal,
              fontSize: 32.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 230, 230),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              height: h * 0.13,
              width: w,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        children: [
                          const Icon(
                            IconlyLight.location,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: w * 0.03,
                          ),
                          const Text(
                            'Ciomas,Bogor. Jawa Barat',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: w * 0.15,
                          ),
                          const Icon(IconlyLight.arrow_right_2)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.015,
              width: w,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 231, 230, 230),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28.0, vertical: 18),
                      child: Row(
                        children: [
                          Text(
                            'Produk',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => cartList.isEmpty
                          ? Expanded(
                              child: Column(
                              children: [
                                Lottie.asset('assets/lottie/cart.json',
                                    width: 250),
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                const Text(
                                  'Keranjang kamu masih kosong nih :(',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          : Expanded(
                              child: Obx(() => ListView.builder(
                                  itemCount: cartList.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return CartProduct(
                                      product: cartList[index],
                                    );
                                  })),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: InkWell(
                          onTap: () {},
                          child: Obx(
                            () => Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                gradient: cartList.isEmpty
                                    ? const LinearGradient(colors: [
                                        Color.fromARGB(255, 182, 182, 182),
                                        Color.fromARGB(255, 180, 180, 180)
                                      ])
                                    : const LinearGradient(colors: [
                                        Colors.teal,
                                        Color.fromARGB(240, 12, 190, 148)
                                      ]),
                              ),
                              height: h * 0.075,
                              width: w * 0.9,
                              child: const Center(
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 19.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
