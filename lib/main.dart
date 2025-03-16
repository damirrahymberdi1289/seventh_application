import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:seventh_application/models/coffee_shop.dart';
import 'package:seventh_application/pages/cart_page.dart';
import 'package:seventh_application/pages/favorites_page.dart';
import 'package:seventh_application/pages/shop_page.dart';
import 'package:seventh_application/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [ShopPage(), CartPage(), FavoritesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 97, 190),
      appBar: AppBar(
        title: Text("Zheka's Doner"),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/menu2.png'),
                  fit: BoxFit.fill,
                ),
              ),

              child: Image.asset('lib/images/menu2.png', fit: BoxFit.cover),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: () => navigateBottomBar(1),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () => navigateBottomBar(2),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20, top: 10),

        child: GNav(
          onTabChange: navigateBottomBar,
          color: const Color.fromARGB(255, 255, 255, 255),
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: const Color.fromARGB(255, 10, 97, 190),
          tabBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          tabBorderRadius: 50,

          tabs: const [
            GButton(icon: Icons.home, text: 'Shop'),
            GButton(icon: Icons.shopping_cart, text: 'Cart'),
            GButton(icon: Icons.favorite, text: 'Favorites'),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
