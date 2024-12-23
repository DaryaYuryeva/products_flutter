import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products/products_cubit.dart';
import '../models/products/product.dart';
import '../views/common/loading_indicator.dart';
import '../views/products/product_card_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<ProductsCubit, List<Product>>(
        builder: (context, products) {
          if (products.isNotEmpty) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCardWidget(
                  product: products[index],
                );
              },
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
