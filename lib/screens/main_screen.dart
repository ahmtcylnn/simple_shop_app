import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/data/api/category_api.dart';
import 'package:http_demo_engindemirog/data/api/product_api.dart';
import 'package:http_demo_engindemirog/models/category.dart';
import 'package:http_demo_engindemirog/models/product.dart';
import 'package:http_demo_engindemirog/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = [];
  List<Widget> categoryWidgets = [];
  List<Product> products = [];

  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        // ignore: avoid_print
        print(response.body);
        Iterable list = json.decode(response.body);
        categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (var i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: OutlinedButton(
          onPressed: () {
            getProductsByCategoryId(category);
          },
          child: Text(
            category.categoryName,
            style: const TextStyle(color: Colors.blueGrey),
          )),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      // ignore: avoid_print
      print(response.body);
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void getProducts() {
    ProductApi.getProducts().then((response) {
      // ignore: avoid_print
      print(response.body);
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
