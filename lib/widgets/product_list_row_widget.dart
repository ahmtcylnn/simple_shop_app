import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  final Product product;
  const ProductListRowWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width / 2,
              child: Image.network(
                  "https://images.unsplash.com/photo-1692641995795-59026e35e458?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            ),
            Text(getProductName(product)),
            getProductPrice(product),
          ],
        ),
      ),
    );
  }

  String getProductName(Product product) {
    int howManyChar = product.productName.length;
    if (howManyChar < 10) {
      return product.productName;
    } else {
      String truncatedName = product.productName.substring(0, 10);
      return '$truncatedName...';
    }
  }

  Widget getProductPrice(Product product) {
    return Text(
      "${product.unitPrice} TL",
      style: const TextStyle(fontSize: 18, color: Colors.green),
    );
  }
}
