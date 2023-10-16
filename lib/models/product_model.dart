import 'package:flutter/material.dart';

class ProductModel {
  String image;
  String name;
  double price;
  double oldPrice;
  int discount;
  List<Color>? listOfColors;
  List<String>? listOfSizes;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.discount,
    this.listOfColors,
    this.listOfSizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json["image"],
      name: json["name"],
      price: json["price"]?.toDouble(),
      oldPrice: json["old_price"]?.toDouble(),
      discount: json["discount"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "discount": discount,
    "old_price" : oldPrice,
    "price" : price,
  };
}