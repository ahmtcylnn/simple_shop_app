class Product {
  late int id;
  late int categoryId;
  late String productName;
  late String quantityPerunit;
  late double unitPrice;
  late int unitInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerunit,
      this.unitPrice, this.unitInStock);

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"] as int? ?? 0;
    categoryId = json["categoryId"] as int? ?? 0;
    productName = json["productName"] as String? ?? "";
    quantityPerunit = json["quantityPerUnit"] as String? ?? "";

    try {
      unitPrice = double.parse(json["unitPrice"].toString());
    } catch (e) {
      unitPrice = 0.0; // Hata durumunda varsayılan değer
    }

    unitInStock = json["unitInStock"] as int? ?? 0;
  }

  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerunit": quantityPerunit,
      "unitPrice": unitPrice,
      "unitInStock": unitInStock,
    };
  }
}
