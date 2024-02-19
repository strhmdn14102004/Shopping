import 'package:get/get.dart';

class CartController extends GetxController {
  var isSelectAll = false.obs;

  void changeSelectAllIcon() {
    isSelectAll.value = !isSelectAll.value;
  }
}
