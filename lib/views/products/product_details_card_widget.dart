import 'package:flutter/material.dart';

import '../../model/product.dart';
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
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}
