import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../models/products/product.dart';
import '../../../bloc/cart/cart_cubit.dart';
import '../../common/main_button.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return MainButton(
      title: 'Add to cart',
      action: () {
        context.read<CartCubit>().addProductToCart(product);
      },
      buttonWidth: double.infinity,
    );
  }
}
