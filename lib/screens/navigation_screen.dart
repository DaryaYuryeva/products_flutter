import 'package:flutter/material.dart';
import 'package:products_flutter/screens/cart_screen.dart';
import 'package:products_flutter/screens/products_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Badge(
              label: Text('1'),
              child: Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Cart',
          ),
        ],
      ),
      body: const <Widget>[
        ProductsScreen(),
        CartScreen(),
      ][currentPageIndex],
    );
  }
}
