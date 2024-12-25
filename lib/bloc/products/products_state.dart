import 'package:products_flutter/models/products/product.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded({required this.products});
}

class ProductsFailed extends ProductsState {
  final String errorMessage;

  ProductsFailed({required this.errorMessage});
}
