import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_source/remote/products_remote_data_source.dart';
import 'products_state.dart';

/// A Cubit responsible for managing the state of product data.
class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRemoteDataSource dataSource;

  /// Initializes the ProductsCubit with a remote data source and fetches products.
  ProductsCubit(this.dataSource) : super(ProductsInitial()) {
    getProducts(); // Automatically fetch products when the cubit is created.
  }

  /// Fetches the list of products from the remote data source.
  /// Emits loading, success, or failure states based on the result.
  Future<void> getProducts() async {
    // Emit a loading state while fetching products.
    emit(ProductsLoading());

    try {
      // Attempt to load products from the remote data source.
      final products = await dataSource.loadProducts();

      // Emit a loaded state with the fetched product data.
      emit(ProductsLoaded(products: products));
    } catch (error) {
      // Emit a failure state with the error message if fetching fails.
      emit(ProductsFailed(errorMessage: error.toString()));
    }
  }
}

