import 'package:flutter/material.dart';
import 'package:seventh_application/models/coffee.dart';
import 'package:provider/provider.dart';
import 'package:seventh_application/models/coffee_shop.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onPressed;
  final Widget icon;

  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final coffeeShop = Provider.of<CoffeeShop>(context);
    final isFavorite = coffeeShop.favorites.contains(coffee);

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 1),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text("\Cost: ${coffee.price}"),
        leading: Image.asset(coffee.imagePath),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color:
                    isFavorite
                        ? Colors.blue
                        : const Color.fromARGB(255, 75, 75, 75),
              ),
              onPressed: () {
                coffeeShop.toggleFavorite(coffee);
              },
            ),
            IconButton(icon: icon, onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
