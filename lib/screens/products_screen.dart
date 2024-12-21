import 'package:flutter/material.dart';

import '../model/product.dart';
import '../views/products/product_card_widget.dart';

class ProductsScreen extends StatefulWidget {
  final List<Product> products;

  const ProductsScreen({
    super.key,
    required this.products,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
        ),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return ProductCardWidget(
            product: widget.products[index],
          );
        },
      ),
    );
  }
}
