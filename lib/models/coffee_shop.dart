import 'package:flutter/material.dart';
import 'package:seventh_application/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(name: 'Latte', price: '4.10', imagePath: "lib/images/latte.png"),
    Coffee(name: 'Espresso', price: '5', imagePath: "lib/images/Espresso.png"),
    Coffee(
      name: 'Cappuccino',
      price: '3.60',
      imagePath: "lib/images/capucino.png",
    ),
    Coffee(
      name: 'Americano',
      price: '4.30',
      imagePath: "lib/images/Americano.png",
    ),
  ];

  List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
