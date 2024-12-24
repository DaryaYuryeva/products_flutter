import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cart/cart_cubit.dart';
import '../../../../models/products/product.dart';
import '../../../models/cart/shopping_cart.dart';
import '../../../models/cart/shopping_cart_item.dart';
import '../change_quantity/quantity_widget.dart';
import 'add_to_cart_button.dart';

class AddToCartWidget extends StatelessWidget {
  final Product product;

  const AddToCartWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, ShoppingCart>(
      builder: (context, cart) {
        final cartItem = cart.items.firstWhere(
          (item) => item.product.id == product.id,
          orElse: () => ShoppingCartItem(product: product, quantity: 0),
        );
        if (cartItem.quantity == 0) {
          return AddToCartButton(product: product);
        } else {
          return QuantityWidget(item: cartItem);
        }
      },
    );
  }
}
