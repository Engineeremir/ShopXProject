// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    @required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.priceSign,
    required this.currency,
    required this.imageLink,
    required this.productLink,
    required this.websiteLink,
    required this.description,
    required this.rating,
    required this.category,
    required this.productType,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.productApiUrl,
    required this.apiFeaturedImage,
    required this.productColors,
  });

  int? id;
  String brand;
  String name;
  String price;
  String priceSign;
  String currency;
  String imageLink;
  String productLink;
  String websiteLink;
  String description;
  double rating;
  String category;
  String productType;
  List<String> tagList;
  DateTime createdAt;
  DateTime updatedAt;
  String productApiUrl;
  String apiFeaturedImage;
  List<ProductColor> productColors;

  var isFavorite = false.obs;

  factory Product.fromJson(Map<String, dynamic> json) => Product(

    id: json["id"],
    brand: json["brand"] == null ? ' ' : json["brand"],
    name: json["name"] == null ? ' ' : json["name"],
    price: json["price"] == null ? ' ' : json["price"],
    priceSign: json["price_sign"] == null ? ' ' : json["price_sign"],
    currency: json["currency"] == null ? ' ' : json["currency"],
    imageLink: json["image_link"],
    productLink: json["product_link"],
    websiteLink: json["website_link"],
    description: json["description"] == null ? ' ' : json["description"],
    rating: json["rating"] == null ? 0.0 : json["rating"].toDouble(),
    category: json["category"] == null ? ' ' : json["category"],
    productType: json["product_type"],
    tagList: List<String>.from(json["tag_list"].map((x) => x)),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productApiUrl: json["product_api_url"],
    apiFeaturedImage: json["api_featured_image"],
    productColors: List<ProductColor>.from(json["product_colors"].map((x) => ProductColor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand == null ? " " : brand,
    "name": name == null ? " " : name,
    "price": price == null ? " " : price,
    "price_sign": priceSign == null ? "  " : priceSign,
    "currency": currency == null ? " " : currency,
    "image_link": imageLink == null ? " ": imageLink,
    "productLink": productLink == null ? " ": productLink,
    "websiteLink": websiteLink == null ? " ": websiteLink,
    "description": description == null ? " " : description,
    "rating": rating == null ? 0.0 : rating,
    "category": category == null ? " " : category,
    "productType": productType == null ? " " : productType,
    "tag_list": List<dynamic>.from(tagList.map((x) => x)),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_api_url": productApiUrl,
    "api_featured_image": apiFeaturedImage,
    "product_colors": List<dynamic>.from(productColors.map((x) => x.toJson())),
  };
}

class ProductColor {
  ProductColor({
    required this.hexValue,
    required this.colourName,
  });

  String hexValue;
  String colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
    hexValue: json["hex_value"],
    colourName: json["colour_name"] == null ? 'ghjuhgj' : json["colour_name"],
  );

  Map<String, dynamic> toJson() => {
    "hex_value": hexValue,
    "colour_name": colourName == null ? 'ghjuhgj' : colourName,
  };
}
