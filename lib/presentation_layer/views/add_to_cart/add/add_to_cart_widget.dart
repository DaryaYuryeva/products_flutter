import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/cart/shopping_cart_item.dart';
import '../../../../models/products/product.dart';
import '../../../bloc/cart/cart_cubit.dart';
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
    final cartItems = context.watch<CartCubit>().state.items;
    final cartItem = cartItems.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ShoppingCartItem(product: product, quantity: 0),
    );
    return (cartItem.quantity == 0)
        ? AddToCartButton(product: product)
        : QuantityWidget(item: cartItem);
  }
}
