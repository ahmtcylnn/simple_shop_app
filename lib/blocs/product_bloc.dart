import 'dart:async';

import 'package:http_demo_engindemirog/data/product_service.dart';
import 'package:http_demo_engindemirog/models/product_with_image.dart';

class ProductBloc {
  final productStreamController = StreamController.broadcast();
  Stream get getStream => productStreamController.stream;
  List<ProductWithImage> getAll() {
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();
