import 'dart:convert';

import 'package:http_demo_engindemirog/data/api/product_api_with_image.dart';

import 'package:http_demo_engindemirog/models/product_with_image.dart';

class ProductService {
  static List<ProductWithImage> products = [];
  static final ProductService _singleton = ProductService._internal();
  factory ProductService() {
    return _singleton;
  }
  ProductService._internal();
  static List<ProductWithImage> getAll() {
    ProductApiWithImage.getProducts().then((response) {
      // ignore: avoid_print
      print(response.body);
      Iterable list = json.decode(response.body);
      products =
          list.map((product) => ProductWithImage.fromJson(product)).toList();
    });
    return products;
  }
}
