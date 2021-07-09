import 'package:chiedoziedivine/models/Category.dart';
import 'package:chiedoziedivine/models/ExtraItems.dart';
import 'package:chiedoziedivine/models/Extras.dart';
import 'package:chiedoziedivine/models/Images.dart';

class Product {
  int id;
  String name;
  int price;
  String beforeSalePrice;
  String description;
  String fullDescription;
  int order;
  Category category;
  Images images;
  List<Extras> extras;
  List<ExtraItems> extraItems;
  List<String> tags;
  String availability;

  Product(
      {this.id,
        this.name,
        this.price,
        this.beforeSalePrice,
        this.description,
        this.fullDescription,
        this.order,
        this.category,
        this.images,
        this.extras,
        this.extraItems,
        this.tags,
        this.availability});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    beforeSalePrice = json['before_sale_price'];
    description = json['description'];
    fullDescription = json['full_description'];
    order = json['order'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
    if (json['extras'] != null) {
      extras = new List<Extras>();
      json['extras'].forEach((v) {
        extras.add(new Extras.fromJson(v));
      });
    }
    if (json['extra_items'] != null) {
      extraItems = new List<ExtraItems>();
      json['extra_items'].forEach((v) {
        extraItems.add(new ExtraItems.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['before_sale_price'] = this.beforeSalePrice;
    data['description'] = this.description;
    data['full_description'] = this.fullDescription;
    data['order'] = this.order;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    if (this.extras != null) {
      data['extras'] = this.extras.map((v) => v.toJson()).toList();
    }
    if (this.extraItems != null) {
      data['extra_items'] = this.extraItems.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    data['availability'] = this.availability;
    return data;
  }
}