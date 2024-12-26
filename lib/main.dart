import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart/cart_cubit.dart';
import 'bloc/products/products_cubit.dart';
import 'data_source/local/cart_local_database.dart';
import 'data_source/remote/products_remote_data_source.dart';
import 'get_it/injection_container.dart' as di;
import 'get_it/injection_container.dart';
import 'screens/navigation_screen.dart';

///The main entry point of the application.
Future<void> main() async {
  // Ensures Flutter framework is fully initialized before running asynchronous code.
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize DI container with getIt.
  await di.init();
  // Launch the application.
  runApp(const MyApp());
}

/// The root widget of the application.
/// It configures themes and state management using Bloc.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Registering BlocProviders for state management.
      providers: [
        BlocProvider(
          // Creates an instance of ProductsCubit using ProductsRemoteDataSource dependency.
          create: (_) => ProductsCubit(getIt<ProductsRemoteDataSource>()),
        ),
        BlocProvider(
          // Creates an instance of CartCubit using CartLocalDatabase dependency.
          create: (_) => CartCubit(getIt<CartLocalDatabase>()),
        ),
      ],
      child: MaterialApp(
        // Disable the debug banner in the top-right corner of the screen.
        debugShowCheckedModeBanner: false,
        // Configure the application's theme.
        theme: ThemeData(
          // Generate a color scheme based on the given seed color (orange).
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          // Enable the new Material Design 3 features.
          useMaterial3: true,
        ),
        // The initial screen of the application.
        home: const NavigationScreen(),
      ),
    );
  }
}
