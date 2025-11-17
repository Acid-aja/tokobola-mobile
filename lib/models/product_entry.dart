// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String categoryDisplay;
    String thumbnail;
    int views;
    bool isFeatured;
    int userId;
    String userUsername;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.categoryDisplay,
        required this.thumbnail,
        required this.views,
        required this.isFeatured,
        required this.userId,
        required this.userUsername,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        categoryDisplay: json["category_display"],
        thumbnail: json["thumbnail"] ?? "",
        views: json["views"],
        isFeatured: json["is_featured"],
        userId: json["user_id"],
        userUsername: json["user_username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "category_display": categoryDisplay,
        "thumbnail": thumbnail,
        "views": views,
        "is_featured": isFeatured,
        "user_id": userId,
        "user_username": userUsername,
    };
}
