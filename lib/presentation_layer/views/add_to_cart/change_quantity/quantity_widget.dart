import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/cart/shopping_cart_item.dart';
import '../../../bloc/cart/cart_cubit.dart';
import 'plus_minus_button.dart';

class QuantityWidget extends StatelessWidget {
  final ShoppingCartItem item;

  const QuantityWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlusMinusButton(
          buttonType: PlusMinusButtonType.minus,
          action: () {
            context.read<CartCubit>().removeProductFromCart(item.product);
          },
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text('${item.quantity}'),
        ),
        PlusMinusButton(
          buttonType: PlusMinusButtonType.plus,
          action: () {
            context.read<CartCubit>().addProductToCart(item.product);
          },
        ),
      ],
    );
  }
}
