import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/const/color.dart';
import 'package:http_demo_engindemirog/const/text_style.dart';

import 'package:http_demo_engindemirog/data/api/category_api_with_image.dart';
import 'package:http_demo_engindemirog/data/api/product_api_with_image.dart';
import 'package:http_demo_engindemirog/models/categorty_with_image.dart';
import 'package:http_demo_engindemirog/models/product_with_image.dart';
import 'package:http_demo_engindemirog/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<CategoryWithImage> categories = [];
  List<Widget> categoryWidgets = [];
  List<ProductWithImage> products = [];

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
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                getProducts();
              },
              icon: const Icon(
                Icons.home,
                color: iconColor,
              ))
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            color: iconColor,
          ),
          onPressed: () => Navigator.pushNamed(context, "/cart"),
        ),
        centerTitle: true,
        title: const Text(
          "Alışveriş Sistemi",
          style: appbarTextStyle,
        ),
        backgroundColor: appbarBackgroundColor,
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
    CategoryApiWithImage.getCategories().then((response) {
      setState(() {
        // ignore: avoid_print
        print(response.body);
        Iterable list = json.decode(response.body);
        categories = list
            .map((category) => CategoryWithImage.fromJson(category))
            .toList();
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

  Widget getCategoryWidget(CategoryWithImage category) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: OutlinedButton(
          onPressed: () {
            getProductsByCategoryId(category);
          },
          child: Text(
            category.name,
            style: categoryRowTextStyle,
          )),
    );
  }

  void getProductsByCategoryId(CategoryWithImage category) {
    ProductApiWithImage.getProductsByCategoryId(category.id).then((response) {
      // ignore: avoid_print
      print(response.body);
      setState(() {
        Iterable list = json.decode(response.body);
        products =
            list.map((product) => ProductWithImage.fromJson(product)).toList();
      });
    });
  }

  void getProducts() {
    ProductApiWithImage.getProducts().then((response) {
      // ignore: avoid_print
      print(response.body);
      setState(() {
        try {
          Iterable list = json.decode(response.body);
          products = list
              .map((product) => ProductWithImage.fromJson(product))
              .toList();
        } catch (e) {
          // ignore: avoid_print
          print('Error decoding JSON: $e');
        }
      });
    });
  }
}
