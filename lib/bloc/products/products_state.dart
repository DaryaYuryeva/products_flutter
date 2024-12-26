import '../../models/products/product.dart';

abstract class ProductsState {}

/// Initial state before any product data is loaded.
class ProductsInitial extends ProductsState {}

/// State indicating that products are being loaded.
class ProductsLoading extends ProductsState {}

/// State indicating that products have been successfully loaded.
class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded({required this.products});
}

/// State indicating that an error occurred while fetching products.
class ProductsFailed extends ProductsState {
  final String errorMessage;

  ProductsFailed({required this.errorMessage});
}
