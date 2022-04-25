import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../model/product_moel.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: Product.products.length,
        itemBuilder: ((context, index) {
          return ListOfProducts(
            index: index,
          );
        }),
      ),
    );
  }
}

class ListOfProducts extends StatelessWidget {
  final cartController = Get.put(CartController());
  ListOfProducts({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage('${Product.products[index].images}'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Product.products[index].name,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Price:${Product.products[index].price}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: (() {
                  cartController.addProduct(Product.products[index]);
                }),
                child: Text('Add to \n Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
