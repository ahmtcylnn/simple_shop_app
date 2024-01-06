import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/blocs/cart_bloc.dart';
import 'package:http_demo_engindemirog/const/text_style.dart';
import 'package:http_demo_engindemirog/models/cart.dart';
import 'package:http_demo_engindemirog/models/product_with_image.dart';

class ProductDetail extends StatelessWidget {
  final ProductWithImage product;
  const ProductDetail(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 60,
          ),
          getProductImage(product),
          getCategoryName(product),
          const SizedBox(
            height: 20,
          ),
          getProductTitleAndPrice(product),
          const SizedBox(
            height: 20,
          ),
          getProductDetails(product),
          addToCart(product)
        ]),
      ),
    );
  }

  Widget addToCart(ProductWithImage product) {
    return Align(
        alignment: Alignment.bottomRight,
        child: OutlinedButton(
            onPressed: () {
              cartBloc.addToCart(Cart(product, 1));
            },
            child: const Text(
              "Add to Cart",
              style: addToCartButtonText,
            )));
  }

  getProductImage(ProductWithImage product) {
    return Center(
      child: SizedBox(
          child: Image.network(
        product.images.first,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return const Icon(Icons.error);
        },
      )),
    );
  }

  getCategoryName(ProductWithImage product) {
    return Text(
      product.category.name,
      style: productDetailTextStyle,
    );
  }

  getProductTitleAndPrice(ProductWithImage product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(
          product.title,
          style: productTextStyle,
        ),
        Text(
          "${product.price.toString()} TL",
          style: productDetailPriceTextStyle,
        ),
      ],
    );
  }

  getProductDetails(ProductWithImage product) {
    return Text(product.description);
  }
}
