import 'package:flutter/material.dart';

import '../../models/cart/shopping_cart_item.dart';
import '../common/image/single_image_widget.dart';
import '../common/quantity_widget.dart';

class ShoppingCartCardWidget extends StatelessWidget {
  final ShoppingCartItem item;

  const ShoppingCartCardWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleImageWidget(
            width: 100,
            imageUrlString: product.images.first,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title),
              Text(product.price.toString()),
            ],
          ),
          const Spacer(),
          QuantityWidget(
            item: item,
          ),
        ],
      ),
    );
  }
}
