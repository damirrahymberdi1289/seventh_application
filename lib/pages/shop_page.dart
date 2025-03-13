import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventh_application/components/coffee_tile.dart';
import 'package:seventh_application/models/coffee.dart';
import 'package:seventh_application/models/coffee_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(title: Text("Successfully added to cart")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder:
          (context, value, child) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const Text(
                    "How would like your coffee?",
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(height: 25),

                  Expanded(
                    child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index) {
                        Coffee eachCoffee = value.coffeeShop[index];

                        return CoffeeTile(
                          coffee: eachCoffee,
                          icon: Icon(Icons.add),
                          onPressed: () => addToCart(eachCoffee),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
