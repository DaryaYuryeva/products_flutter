import 'package:flutter/material.dart';

import '../../../models/products/product.dart';
import '../add_to_cart/add/add_to_cart_widget.dart';
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
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleImageWidget(
                  imageUrlString: product.images.first,
                ),
              ),
              Text(
                product.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                product.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 30,
              ),
              Text(
                '${product.price}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              AddToCartWidget(
                product: product,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
