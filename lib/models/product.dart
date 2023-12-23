class Product {
  late int id;
  late int categoryId;
  late String productName;
  late String quantityPerunit;
  late double unitPrice;
  late int unitInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerunit,
      this.unitPrice, this.unitInStock);

  Product.toJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    productName = json["productName"];
    quantityPerunit = json["quantityPerUnit"];
    unitPrice = json["unitPrice"];
    unitInStock = json["unitInStock"];
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
