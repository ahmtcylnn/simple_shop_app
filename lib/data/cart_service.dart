import 'package:http_demo_engindemirog/models/cart.dart';

class CartService {
  static List<Cart> cartItems = [];

  static CartService singleton = CartService._internal();
  factory CartService() {
    return singleton;
  }
  CartService._internal();

  static void addToCart(Cart item) {
    cartItems.add(item);
  }

  static void removeFromCart(Cart item) {
    cartItems.remove(item);
  }

  static List<Cart> getCart() {
    return cartItems;
  }
}
