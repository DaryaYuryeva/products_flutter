import 'package:flutter/material.dart';

import '../../models/cart/shopping_cart_item.dart';
import '../add_to_cart/change_quantity/quantity_widget.dart';
import '../common/image/single_image_widget.dart';

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
          Expanded(
            child: SingleImageWidget(
              width: 150,
              height: 120,
              imageUrlString: product.images.first,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  //maxLines: 2,
                ),
                Text(
                  '${product.price}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          QuantityWidget(
            item: item,
          ),
        ],
      ),
    );
  }
}
