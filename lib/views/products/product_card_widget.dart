import 'package:flutter/material.dart';

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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailsCardWidget(product: product)),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
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
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}
