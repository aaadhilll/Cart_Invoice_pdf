import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice2/view/widgets/cart_products.dart';

import '../controller/cart_controller.dart';

class PageOfCart extends StatelessWidget {
  const PageOfCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.shopping_cart),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            child: CartProducts(),
          ),
          CartTotal()
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);
  final sTyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: double.infinity,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cart Total',
                      style: sTyle,
                    ),
                    Text(
                      '${controller.total}',
                      style: sTyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price After Adding  Coupon ',
                      style: sTyle,
                    ),
                    Text(
                      '${controller.offer.toStringAsFixed(2)}',
                      style: sTyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax Amount  ',
                      style: sTyle,
                    ),
                    Text(
                      '${controller.taX.toStringAsFixed(2)}',
                      style: sTyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount Payable ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${controller.thePay.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
