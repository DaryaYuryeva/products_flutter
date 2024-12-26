import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products/products_cubit.dart';
import '../bloc/products/products_state.dart';
import '../views/common/loading_indicator.dart';
import '../views/products/empty_products_widget.dart';
import '../views/products/product_card_widget.dart';
import '../views/products/retry_loading_products_widget.dart';

/// A screen that displays the grid of products.
///
/// The [ProductsScreen] is a stateless widget that shows a grid of products.
/// It listens to the [ProductsCubit] to update the UI based on the current state
/// of the products data. If the products are being loaded, a loading indicator
/// is shown. If products are successfully loaded, they are displayed in a grid.
/// If loading fails, a retry option is provided.
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
      // BlocBuilder listens to changes in the ProductsCubit state and updates the UI accordingly.
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          // If ProductsState is loading, display a loading indicator.
          if (state is ProductsLoading) {
            return const LoadingIndicator();
          }

          // If ProductsState is loaded.
          if (state is ProductsLoaded) {
            if (state.products.isNotEmpty) {
              //If products is not empty, display them in a grid.
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
            // If there are no products, show an custom widget.
            return const EmptyProductsWidget();
          }

          // If ProductsState is failed, show an custom widget with retry option and error message.
          if (state is ProductsFailed) {
            return RetryLoadingProductsWidget(
              errorText: state.errorMessage,
            );
          }

          // In case of an unexpected state, show an custom widget with retry option.
          return const RetryLoadingProductsWidget(
            errorText: 'Something went wrong, try again.',
          );
        },
      ),
    );
  }
}
