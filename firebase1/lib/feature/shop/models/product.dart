class ProductModel {
  int id;
  String title;
  String detail;
  double price;
  int size;
  List<dynamic> colors;
  String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.detail,
    required this.price,
    required this.size,
    required this.colors,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "detail": detail,
        "price": price,
        "size": size,
        "colors": colors,
        "image": image,
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      detail: json["detail"],
      price: json["price"],
      size: json["size"],
      colors: json["colors"],
      image: json["image"],
    );
  }
}