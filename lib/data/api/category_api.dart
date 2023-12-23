import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getProducts() {
    return http.get(Uri.parse("http://10.0.0.2:3000/categories"));
  }
}
