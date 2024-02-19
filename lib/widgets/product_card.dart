import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/screens/product_overview.dart';
import 'package:ecommerce_app/services/cart_service.dart';
import 'package:ecommerce_app/services/favourite_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

RxBool isLiked = false.obs;
RxBool addToCart = false.obs;

class ProductCard extends StatefulWidget {
  Product productDetails;
  ProductCard({super.key, required this.productDetails});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  FavoritesController favController = Get.put(FavoritesController());

  CartPageController addingCartController = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => Get.to(ProductOverviewPage(product: widget.productDetails)),
      child: Column(
        children: [
          //PRODUCT IMAGES
          Stack(
            children: [
              Container(
                height: h * 0.18,
                width: w * 0.35,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.productDetails.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    isLiked.value = !isLiked.value;
                    if (favoriteList.contains(widget.productDetails)) {
                      favController.removeFavorite(widget.productDetails);
                      Get.showSnackbar(const GetSnackBar(
                        message: 'Hapus dari favorit :(',
                        duration: Duration(milliseconds: 900),
                      ));
                    } else {
                      favController.addFavorite(widget.productDetails);
                      Get.showSnackbar(const GetSnackBar(
                        message: 'Tambah ke favorit :)',
                        duration: Duration(milliseconds: 900),
                      ));
                    }
                  },
                  child: Obx(() => Container(
                      color: Colors.transparent,
                      child: isLiked.value
                          ? const Icon(IconlyBold.heart, color: Colors.red)
                          : const Icon(IconlyLight.heart, color: Colors.grey))),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                      onTap: () {
                        addToCart.value = !addToCart.value;
                        if (cartList.contains(widget.productDetails)) {
                          addingCartController
                              .removeProduct(widget.productDetails);
                          Get.showSnackbar(const GetSnackBar(
                            message: 'Hapus dari keranjang.',
                            duration: Duration(milliseconds: 900),
                          ));
                        } else {
                          addingCartController
                              .addProduct(widget.productDetails);
                          Get.showSnackbar(const GetSnackBar(
                            message: 'Tambah ke keranjang.',
                            duration: Duration(milliseconds: 900),
                          ));
                        }
                      },
                      child: Obx(
                        () => Container(
                          child: addToCart.value
                              ? const Icon(
                                  IconlyBold.tick_square,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  IconlyLight.plus,
                                  color: Colors.grey,
                                ),
                        ),
                      ))),
              widget.productDetails.onSale
                  ? Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.lime,
                            borderRadius: BorderRadius.circular(5)),
                        height: h * 0.03,
                        width: w * 0.1,
                        child: const Center(
                            child: Text(
                          'Sale',
                          style: TextStyle(
                             color: Colors.black,
                              fontFamily: 'Lato', fontWeight: FontWeight.bold),
                        )),
                      ))
                  : Container(
                      height: 0,
                      width: 0,
                      color: Colors.transparent,
                    )
            ],
          ),
          SizedBox(
            height: h * 0.01,
          ),

          //PRODUCT  TITLE
          Text(
            widget.productDetails.name,
            style: const TextStyle(
                fontFamily: 'Lato', fontSize: 15,      fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: h * 0.007,
          ),
          //PRODUCT PRICES
          Text(
            widget.productDetails.price,
            style: const TextStyle(
                fontFamily: 'Lato', fontSize: 13,     fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
