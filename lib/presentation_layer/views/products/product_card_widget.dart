import 'package:flutter/material.dart';

import '../../../models/products/product.dart';
import '../add_to_cart/add/add_to_cart_widget.dart';
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
            Text(
              product.title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              '${product.price}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            AddToCartWidget(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
