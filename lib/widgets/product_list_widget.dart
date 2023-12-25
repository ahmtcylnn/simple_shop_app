import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/models/product.dart';

class ProductListWidget extends StatefulWidget {
  final List<Product> products;
  ProductListWidget(this.products, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return Text(widget.products[index].productName);
        },
      ),
    );
  }
}
