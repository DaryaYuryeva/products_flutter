import 'package:get_it/get_it.dart';

import '../data_source/local/cart_local_database.dart';
import '../data_source/remote/products_remote_data_source.dart';

/// The [GetIt] instance that allows access to registered dependencies throughout the app.
final getIt = GetIt.instance;

/// This method registers the [ProductsRemoteDataSource] and [CartLocalDatabase]
/// as singleton instances to be used across the app. It ensures that these
/// instances are available for dependency injection.
Future<void> init() async {
  getIt.registerSingleton<ProductsRemoteDataSource>(
    ProductsRemoteDataSourceImpl(),
  );

  getIt.registerSingleton<CartLocalDatabase>(
    CartLocalDatabase(),
  );
}
