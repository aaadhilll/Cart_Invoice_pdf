import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../model/product_moel.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 500,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: ((context, index) {
              return CartProductCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            })),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  image: AssetImage('${product.images}'),
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
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Price${product.price}',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      controller.removeProduct(product);
                    },
                    icon: Icon(Icons.remove_circle)),
                Text("${quantity}"),
                IconButton(
                    onPressed: () {
                      controller.addProduct(product);
                    },
                    icon: Icon(Icons.add_circle)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
