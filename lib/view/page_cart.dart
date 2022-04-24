import 'package:flutter/material.dart';
import 'package:invoice2/view/widgets/cart_products.dart';

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
        children: [CartProducts(), CartTotal()],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
