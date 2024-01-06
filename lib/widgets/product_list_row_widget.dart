import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/blocs/cart_bloc.dart';
import 'package:http_demo_engindemirog/const/color.dart';
import 'package:http_demo_engindemirog/const/text_style.dart';
import 'package:http_demo_engindemirog/models/cart.dart';
import 'package:http_demo_engindemirog/models/product_with_image.dart';
import 'package:http_demo_engindemirog/screens/product_detail.dart';

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
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ProductDetail(product)))),
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
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  getProductName(product),
                  style: productTextStyle,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [getProductPrice(product), addToCart(product)]),
            ],
          ),
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
    return Text("${product.price} TL", style: priceTextStyle);
  }

  Widget addToCart(ProductWithImage product) {
    return IconButton(
        iconSize: 20,
        color: addProductIconColor,
        onPressed: () {
          cartBloc.addToCart(Cart(product, 1));
        },
        icon: const Icon(Icons.add));
  }
}
