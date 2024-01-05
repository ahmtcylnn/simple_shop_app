import 'dart:async';

import 'package:http_demo_engindemirog/data/cart_service.dart';
import 'package:http_demo_engindemirog/models/cart.dart';

class CartBloc {
  final cartStreamController = StreamController.broadcast();
  Stream get getStream => cartStreamController.stream;

  void addToCart(Cart item) {
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCart(Cart item) {
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();
