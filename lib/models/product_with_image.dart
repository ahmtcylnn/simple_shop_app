import 'package:http_demo_engindemirog/models/categorty_with_image.dart';

class ProductWithImage {
  late int id;
  late String title;
  late double price;
  late String description;
  late CategoryWithImage category;
  late List<String> images;

  ProductWithImage(this.id, this.title, this.price, this.description,
      this.category, this.images);

  ProductWithImage.fromJson(Map<String, dynamic> json) {
    id = json["id"] as int? ?? 0;
    title = json["title"] as String? ?? "";
    description = json["description"] as String? ?? "";

    try {
      price = (json["price"] as num?)?.toDouble() ?? 0.0;
    } catch (e) {
      price = 0.0; // Hata durumunda varsayılan değer
    }

    if (json['category'] != null) {
      category = CategoryWithImage.fromJson(json['category']);
    } else {
      category = CategoryWithImage(0, "", "");
    }

    var jsonImages = json['images'] as List<dynamic>?;

    if (jsonImages != null && jsonImages.isNotEmpty) {
      images = jsonImages.cast<String>().toList();
    } else {
      images = [];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category.toJson(),
      "images": images,
    };
  }
}
