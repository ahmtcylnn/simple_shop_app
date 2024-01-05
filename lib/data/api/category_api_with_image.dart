import 'package:http/http.dart' as http;

class CategoryApiWithImage {
  static Future getCategories() {
    return http.get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));
  }
}
