import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products/products_cubit.dart';
import '../bloc/products/products_state.dart';
import '../views/common/loading_indicator.dart';
import '../views/products/empty_products_widget.dart';
import '../views/products/product_card_widget.dart';
import '../views/products/retry_loading_products_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const LoadingIndicator();
          }

          if (state is ProductsLoaded) {
            if (state.products.isNotEmpty) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductCardWidget(
                    product: state.products[index],
                  );
                },
              );
            }
            return const EmptyProductsWidget();
          }

          if (state is ProductsFailed) {
            return RetryLoadingProductsWidget(
              errorText: state.errorMessage,
            );
          }

          return const RetryLoadingProductsWidget(
            errorText:
                'Something went wrong, try again.',
          );
        },
      ),
    );
  }
}
