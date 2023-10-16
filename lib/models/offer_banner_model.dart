class OfferBannerModel {
  final bool status;
  final dynamic message;
  final List<BannerItemModel> data;

  OfferBannerModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OfferBannerModel.fromJson(Map<String, dynamic> json) => OfferBannerModel(
    status: json["status"],
    message: json["message"],
    data: List<BannerItemModel>.from(json["data"].map((x) => BannerItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BannerItemModel {
  final int id;
  final String image;
  final dynamic category;
  final dynamic product;

  BannerItemModel({
    required this.id,
    required this.image,
    required this.category,
    required this.product,
  });

  factory BannerItemModel.fromJson(Map<String, dynamic> json) => BannerItemModel(
    id: json["id"],
    image: json["image"],
    category: json["category"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category": category,
    "product": product,
  };
}
