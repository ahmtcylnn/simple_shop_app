import 'package:http/http.dart' as http;

class ProductApiWithImage {
  static Future getProducts() async {
    return http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
  }

  static Future getProductsByCategoryId(int categoryId) {
    return http.get(Uri.parse(
        "https://api.escuelajs.co/api/v1/products?categoryId=$categoryId"));
  }
}
