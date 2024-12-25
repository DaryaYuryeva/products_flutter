import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_source/remote/products_remote_data_source.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRemoteDataSource dataSource;

  ProductsCubit(this.dataSource) : super(ProductsInitial()) {
    getProducts();
  }

  Future<void> getProducts() async {
    emit(ProductsLoading());

    try {
      final products = await dataSource.loadProducts();
      emit(ProductsLoaded(products: products));
    } catch (error) {
      emit(ProductsFailed(errorMessage: error.toString()));
    }
  }
}
