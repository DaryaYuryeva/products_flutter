import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cart/cart_cubit.dart';
import '../../../models/products/product.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.surface,
        ),
        onPressed: () {
          context.read<CartCubit>().addProductToCart(product);
        },
        child: const Text('Add to cart'),
      ),
    );
  }
}
