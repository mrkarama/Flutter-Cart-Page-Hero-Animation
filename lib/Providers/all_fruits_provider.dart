import 'dart:convert';
import 'package:cart_hero_animation/Commons/Models/fruit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllFruitsProvider extends ChangeNotifier {
  List<FruitModel> _data = [];
  List<FruitModel> get data => _data;

  bool _loading = false;
  bool get loading => _loading;

  static const String url = 'assets/fruits/fruits.json';

  Future<void> getData() async {
    final response = jsonDecode(await rootBundle.loadString(url));

    if (response != null) {
      _data = [];
      response['vegetables'].forEach((fruit) {
        _data.add(
          FruitModel.fromJson(fruit),
        );
      });
    } else {
      _data = [];
    }
    notifyListeners();
  }

  int _quantity = 0;
  int get quantity => _quantity;

  void setQantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      notifyListeners();
    } else {
      _quantity = checkQuantity(_quantity - 1);
      notifyListeners();
    }
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      return 0;
    } else if (quantity > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  Map<int, FruitModel> _items = {};
  Map<int, FruitModel> get items => _items;

  void addToCart(FruitModel fruitModel) {
    if (_items.containsKey(fruitModel.id)) {
      _items.update(fruitModel.id, (value) {
        return FruitModel(
          description: fruitModel.description,
          id: fruitModel.id,
          name: fruitModel.name,
          price: fruitModel.price,
          url: fruitModel.url,
          category: fruitModel.category,
        );
      });
    } else {
      _items.putIfAbsent(fruitModel.id, () {
        return FruitModel(
          description: fruitModel.description,
          id: fruitModel.id,
          name: fruitModel.name,
          price: fruitModel.price,
          url: fruitModel.url,
          category: fruitModel.category,
        );
      });
    }
    print(
      'ITEMS LENGTH IS ' + _items.length.toString(),
    );
    notifyListeners();
  }
}
