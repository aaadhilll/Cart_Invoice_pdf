import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice2/controller/pdf_controller.dart';
import 'package:invoice2/model/product_model.dart';

import 'package:invoice2/view/widgets/cart_products.dart';
import 'dart:io';
import '../controller/cart_controller.dart';

class PageOfCart extends StatelessWidget {
  final CartController controller = Get.find();

  final PdfController controler = Get.put(PdfController());
  PageOfCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shadowColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                controller.clearCart();
              },
              child: Text("Clear Cart")),
        )
      ], title: Icon(Icons.shopping_cart), backgroundColor: Colors.green),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                CartProducts(),
              ],
            ),
          ),
          CartTotal()
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  final PdfController controler = Get.find();
  CartTotal({Key? key}) : super(key: key);
  final sTyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          // height: 160,
          color: Colors.grey[280],
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
                      'Dicount Price ',
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
                      'Tax  ',
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
                ElevatedButton(
                  onPressed: () {
                    controler.createPdf2();
                    Get.snackbar(
                      'File Downloaded',
                      'check your downloads',
                    );
                  },
                  child: Text('Download Invoice as Pdf'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
