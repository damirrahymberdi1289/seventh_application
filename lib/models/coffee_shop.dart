import 'package:flutter/material.dart';
import 'package:seventh_application/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
      name: 'Алматинский донер',
      price: '2,590 KZT',
      imagePath: "lib/images/Almatinski doner.png",
    ),
    Coffee(
      name: 'Angry doner',
      price: '1,690 KZT',
      imagePath: "lib/images/angry doner.png",
    ),
    Coffee(
      name: 'Донер на батоне',
      price: '1,590 KZT',
      imagePath: "lib/images/donernabatoen.png",
    ),
    Coffee(
      name: 'Фирменный донер',
      price: '2,090 KZT',
      imagePath: "lib/images/firmenniy doner.png",
    ),
    Coffee(
      name: 'Pizza Doner',
      price: '2,790 KZT',
      imagePath:
          "lib/images/850d3558-89e9-47cd-a0d3-2716ba41112f_removalai_preview.png",
    ),
  ];

  final List<Coffee> _userCart = [];
  final List<Coffee> _favorites = [];

  List<Coffee> get coffeeShop => _shop;
  List<Coffee> get userCart => _userCart;
  List<Coffee> get favorites => _favorites;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  void toggleFavorite(Coffee coffee) {
    if (_favorites.contains(coffee)) {
      _favorites.remove(coffee);
    } else {
      _favorites.add(coffee);
    }
    notifyListeners();
  }
}
