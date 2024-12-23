import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_cubit.dart';
import '../../models/cart/shopping_cart_item.dart';
import '../../models/products/product.dart';
import '../common/button/main_button.dart';
import '../common/image/single_image_widget.dart';

class ProductDetailsCardWidget extends StatelessWidget {
  final Product product;

  const ProductDetailsCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleImageWidget(
              imageUrlString: product.images.first,
              width: 300,
              height: 300,
            ),
            Text(product.title),
            Text(product.description),
            Text(product.price.toString()),
            MainButton(
              title: 'Add to cart',
              action: () {
                context.read<CartCubit>().addProductToCart(
                  ShoppingCartItem(product: product, quantity: 1),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
