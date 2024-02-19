import 'package:ecommerce_app/models/products.dart';
import 'package:get/get.dart';

RxList<dynamic> favoriteList = [].obs;


class FavoritesController extends GetxController{
  void addFavorite(Product prod) {
    favoriteList.add(prod);
  }

  void removeFavorite(Product prod) {
    favoriteList.remove(prod);
  }
}
