import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_cubit.dart';
import '../models/cart/shopping_cart.dart';
import '../views/shopping_cart/shopping_cart_card_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, ShoppingCart>(
        builder: (context, cart) {
          final shoppingCartItems = cart.items;
          if (shoppingCartItems.isNotEmpty) {
            return ListView.builder(
              itemCount: shoppingCartItems.length,
              itemBuilder: (context, index) {
                return ShoppingCartCardWidget(
                  item: shoppingCartItems[index],
                );
              },
            );
          }
          return const Center(
            child: Text('Cart is empty'),
          );
        },
      ),
    );
  }
}
