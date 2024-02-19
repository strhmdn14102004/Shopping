import 'package:ecommerce_app/services/cart_service.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../models/products.dart';

class CartProduct extends StatefulWidget {
  final Product product;
  const CartProduct({super.key, required this.product});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    CartPageController cartPageController = Get.put(CartPageController());

    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 18.0, top: 15),
      child: Container(
        height: h * 0.15,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(15.0)),
        child: Row(children: [
          //DELETE PRODUCT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    cartList.remove(widget.product);
                    addToCart.value = !addToCart.value;
                  },
                  child: Container(
                      height: h * 0.06,
                      width: w * 0.115,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 220, 220),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          IconlyBold.delete,
                          color: Colors.redAccent,
                        ),
                      )),
                )
              ],
            ),
          ),
          //PRODUCT IMAGE
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: h * 0.15,
                  width: w * 0.2,
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(widget.product.image)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: w * 0.12,
          ),

          //PRODUCT DETAILS
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: h * 0.02),
                child: Column(
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: h * 0.004,
                    ),
                    Text(
                      widget.product.price,
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12.5,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              ),

              //QUANTITY INCREMENTER
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.02),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          cartPageController.decrementQuantity();
                        },
                        child: const Icon(IconlyLight.arrow_down_circle,    color: Colors.black,)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: h * 0.038,
                        width: w * 0.082,
                        child: Center(
                          child: Obx(() => Text(quantity.value.toString(),style: TextStyle(color: Colors.black),)),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          cartPageController.incrementQuantity();
                        },
                        child: const Icon(IconlyLight.arrow_up_circle,color: Colors.black,))
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
