import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/blocs/cart_bloc.dart';
import 'package:http_demo_engindemirog/models/cart.dart';
import 'package:http_demo_engindemirog/models/product_with_image.dart';

class ProductListRowWidget extends StatelessWidget {
  final ProductWithImage product;
  // final Product product;
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
                height: 100,
                width: MediaQuery.of(context).size.width / 2,
                child: Image.network(
                  product.images.first,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const Icon(Icons.error);
                  },
                )),
            Text(getProductName(product)),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child:
                  Row(children: [getProductPrice(product), addToCart(product)]),
            ),
          ],
        ),
      ),
    );
  }

  String getProductName(ProductWithImage product) {
    int howManyChar = product.title.length;
    if (howManyChar < 10) {
      return product.title;
    } else {
      String truncatedName = product.title.substring(0, 10);
      return '$truncatedName...';
    }
  }

  Widget getProductPrice(ProductWithImage product) {
    return Text(
      "${product.price} TL",
      style: const TextStyle(fontSize: 15, color: Colors.green),
    );
  }

  Widget addToCart(ProductWithImage product) {
    return IconButton(
        onPressed: () {
          cartBloc.addToCart(Cart(product, 1));
        },
        icon: Icon(Icons.add));
  }
}
