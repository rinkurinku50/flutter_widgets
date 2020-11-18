import 'package:flutter/material.dart';

class ShopNameNotifier extends ChangeNotifier {
  String shopName = '';

  addShopName(String name) {
    this.shopName = name;
    notifyListeners();
  }
}
