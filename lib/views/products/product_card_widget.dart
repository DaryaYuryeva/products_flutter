import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_cubit.dart';
import '../../models/cart/shopping_cart_item.dart';
import '../../models/products/product.dart';
import '../common/button/main_button.dart';
import '../common/image/single_image_widget.dart';
import 'product_details_card_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;

  const ProductCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsCardWidget(product: product)),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleImageWidget(
                imageUrlString: product.thumbnail,
              ),
            ),
            Text(product.title),
            Text(product.price.toString()),
            MainButton(
              title: 'Add to cart',
              action: () {
                context.read<CartCubit>().addProductToCart(
                      ShoppingCartItem(
                        product: product,
                        quantity: 1,
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
