import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_cubit.dart';
import 'cart_screen.dart';
import 'products_screen.dart';

/// A widget representing the main navigation screen of the app.
///
/// The [NavigationScreen] is a `StatefulWidget` that manages the bottom
/// navigation bar and allows the user to switch between different pages,
/// such as the products page and the shopping cart page. The widget uses a
/// `CartCubit` to display the number of items in the shopping cart in the
/// navigation bar, dynamically updating the cart icon when the number of items changes.
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  /// The index of the currently selected page in the bottom navigation bar.
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get the count of items in the shopping cart from the CartCubit.
    final int cartItemsCount = context.watch<CartCubit>().state.items.length;

    return Scaffold(
      // The bottom navigation bar to allow switching between pages.
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,  // The currently selected page index.
        destinations: <Widget>[
          // Home navigation button.
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          // Cart navigation button, dynamically shows cart item count if there are any items.
          cartItemsCount == 0
              ? const NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          )
              : NavigationDestination(
            selectedIcon: Badge(
              label: Text('$cartItemsCount'),
              child: const Icon(Icons.shopping_cart),
            ),
            icon: Badge(
              label: Text('$cartItemsCount'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Cart',
          ),
        ],
      ),
      body: <Widget>[
        // List of pages to navigate between.
        const ProductsScreen(),
        const CartScreen(),
      ][_currentPageIndex],  // Displays the selected page based on _currentPageIndex.
    );
  }
}
