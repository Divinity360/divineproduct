import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:chiedoziedivine/models/Product.dart';
import 'package:flutter/cupertino.dart';

class ApiService {

  Future<Product> readProductFromJSON(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/product.json");
    return Product.fromJson(json.decode(data));
  }
}
