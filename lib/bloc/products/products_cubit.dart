import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_source/remote/products_remote_data_source.dart';
import '../../get_it/injection_container.dart';
import '../../models/products/product.dart';

class ProductsCubit extends Cubit<List<Product>> {
  ProductsCubit() : super([]);

  Future<void> getProducts() async {
    try {
      final products = await getIt<ProductsRemoteDataSource>().loadProducts();
      emit(products);
    } catch (e) {
      emit([]);
    }
  }
}
