class CategoryModel {
  String image;
  String name;

  CategoryModel({
    required this.image,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      image: json["image"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
  };
}
