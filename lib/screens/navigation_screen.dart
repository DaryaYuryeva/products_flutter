import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_cubit.dart';
import 'cart_screen.dart';
import 'products_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final int cartItemsCount = context.watch<CartCubit>().state.items.length;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
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
        const ProductsScreen(),
        const CartScreen(),
      ][_currentPageIndex],
    );
  }
}
