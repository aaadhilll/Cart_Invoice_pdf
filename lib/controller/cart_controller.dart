import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  //  var _products = List<Product>.empty().obs
  // double get totalPrice => _products.fold(0, (sum, item) => sum + item.price);

  // Adding product to cart
  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    //snack bar when button pressed
    Get.snackbar("Added to Cart", " ${product.name}",
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        duration: Duration(milliseconds: 750),
        backgroundColor: Color.fromRGBO(0, 3, 3, 237));
  }

  //Removing product from cart

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }
  // clear cart

  void clearCart() {
    _products.clear();
  }

  // to find the total amount payable

  get productsSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.isEmpty
      ? 0.00
      : _products.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
  get offer => _products.isEmpty
      ? 0.00
      : _products.entries
          .map((product) => product.value * product.key.price * 0.5)
          .toList()
          .reduce((value, element) => value + element);
  get taX => _products.isEmpty
      ? 0.00
      : _products.entries
          .map((product) => product.value * product.key.price * 0.05)
          .toList()
          .reduce((value, element) => value + element);
//total Amount
  get thePay => offer + taX;

  get products => _products;
}
