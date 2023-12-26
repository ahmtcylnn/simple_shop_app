import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/models/product.dart';
import 'package:http_demo_engindemirog/widgets/product_list_row_widget.dart';

class ProductListWidget extends StatefulWidget {
  final List<Product> products;
  const ProductListWidget(this.products, {Key? key}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 500,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                widget.products.length,
                (index) {
                  return ProductListRowWidget(widget.products[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
