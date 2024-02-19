import 'package:ecommerce_app/models/products.dart';
import 'package:get/get.dart';

RxList<dynamic> cartList = [].obs;
RxInt quantity = 1.obs;

class CartPageController extends GetxController {
  void addProduct(Product prod) {
    cartList.add(prod);
  }

  void removeProduct(Product prod) {
    cartList.remove(prod);
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    quantity.value--;
    if (quantity.value == 0) {
      //cartList.removeAt(0);
    }
  }
}
