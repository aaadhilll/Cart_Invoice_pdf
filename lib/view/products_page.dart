import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice2/view/page_cart.dart';
import 'package:invoice2/view/widgets/product_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Text(
      //     'Product Catalog',
      //     style: GoogleFonts.kanit(
      //       color: Colors.white,
      //       fontSize: 25,
      //       // fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: () {
            Get.to(() => PageOfCart());
          },
          label: Column(
            children: [
              Icon(
                Icons.shopping_cart_checkout,
                color: Colors.white,
              ),
              Text(
                'Cart',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.1,
              child: ProductList(),
            ),
          ],
        ),
      ),
    );
  }
}
