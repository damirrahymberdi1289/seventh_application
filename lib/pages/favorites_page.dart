import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventh_application/components/coffee_tile.dart';
import 'package:seventh_application/models/coffee_shop.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder:
          (context, coffeeShop, child) => Scaffold(
            backgroundColor: const Color.fromARGB(255, 89, 163, 233),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 10, 97, 190),
              title: Center(
                child: const Text(
                  "Favorites",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const SizedBox(height: 0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: coffeeShop.favorites.length,
                      itemBuilder: (context, index) {
                        final coffee = coffeeShop.favorites[index];

                        return CoffeeTile(
                          coffee: coffee,
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            coffeeShop.toggleFavorite(coffee);
                          },
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
