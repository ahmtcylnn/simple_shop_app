class CategoryWithImage {
  late int id;
  late String name;
  late String image;

  CategoryWithImage(this.id, this.name, this.image);

  CategoryWithImage.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }
  Map toJson() {
    return {"id": id, "name": name, "image": image};
  }
}
