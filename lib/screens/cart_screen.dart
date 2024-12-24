import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_cubit.dart';
import '../models/cart/shopping_cart.dart';
import '../views/shopping_cart/empty_cart_widget.dart';
import '../views/shopping_cart/shopping_cart_card_widget.dart';

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
      body: BlocBuilder<CartCubit, ShoppingCart>(
        builder: (context, cart) {
          if (cart.items.isNotEmpty) {
            return ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ShoppingCartCardWidget(
                  item: cart.items[index],
                );
              },
            );
          }
          return const EmptyCartWidget();
        },
      ),
    );
  }
}
