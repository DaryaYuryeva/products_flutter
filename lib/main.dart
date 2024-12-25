import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart/cart_cubit.dart';
import 'bloc/products/products_cubit.dart';
import 'data_source/local/cart_local_database.dart';
import 'data_source/remote/products_remote_data_source.dart';
import 'get_it/injection_container.dart' as di;
import 'get_it/injection_container.dart';
import 'screens/navigation_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductsCubit(getIt<ProductsRemoteDataSource>()),
        ),
        BlocProvider(
          create: (_) => CartCubit(getIt<CartLocalDatabase>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: const NavigationScreen(),
      ),
    );
  }
}
