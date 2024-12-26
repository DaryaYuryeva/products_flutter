import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart/shopping_cart.dart';
import '../bloc/cart/cart_cubit.dart';
import '../views/shopping_cart/empty_cart_widget.dart';
import '../views/shopping_cart/shopping_cart_card_widget.dart';

/// A screen that displays the user's shopping cart.
///
/// The [CartScreen] is a stateless widget that shows the products of the shopping
/// cart. It listens to the [CartCubit] and updates the UI based on the cart's
/// state. If the cart contains items, it displays them using the [ShoppingCartCardWidget].
/// If the cart is empty, it shows an empty cart widget using the [EmptyCartWidget].
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      // BlocBuilder to listen to changes in the CartCubit and rebuild the UI accordingly.
      body: BlocBuilder<CartCubit, ShoppingCart>(
        builder: (context, cart) {
          // Check if the cart contains items.
          if (cart.items.isNotEmpty) {
            // If the cart is not empty, display a list of cart items.
            return ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ShoppingCartCardWidget(
                  item: cart.items[index],
                );
              },
            );
          }
          // If the cart is empty, show an empty cart widget.
          return const EmptyCartWidget();
        },
      ),
    );
  }
}
