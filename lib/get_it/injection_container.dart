import 'package:get_it/get_it.dart';

import '../data_source/local/cart_local_database.dart';
import '../data_source/remote/products_remote_data_source.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<ProductsRemoteDataSource>(
      ProductsRemoteDataSourceImpl());

  getIt.registerSingleton<CartLocalDatabase>(CartLocalDatabase());
}
