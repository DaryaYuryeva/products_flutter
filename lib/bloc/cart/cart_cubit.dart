import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_source/local/cart_local_database.dart';
import '../../models/cart/shopping_cart.dart';
import '../../models/cart/shopping_cart_item.dart';
import '../../models/products/product.dart';

/// A Cubit for managing the state of the shopping cart.
class CartCubit extends Cubit<ShoppingCart> {
  final CartLocalDatabase db;

  /// Initializes the CartCubit with a local database and loads the initial cart state.
  CartCubit(this.db) : super(ShoppingCart.empty()) {
    _loadCartFromDatabase();
  }

  /// Loads the cart items from the local database and updates the state.
  Future<void> _loadCartFromDatabase() async {
    final items = await db.getCartItems();
    emit(ShoppingCart(items: items));
  }

  /// Adds a product to the cart or increments its quantity if it already exists.
  Future<void> addProductToCart(Product product) async {
    final items = state.items;

    // Check if the product already exists in the cart.
    final existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ShoppingCartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      // Add a new item to the cart.
      final newItem = ShoppingCartItem(product: product, quantity: 1);
      items.add(newItem);
      await db.addCartItem(newItem);
    } else {
      // Increment the quantity of the existing item.
      existingItem.quantity++;
      await db.updateCartItem(existingItem);
    }
    // Emit the updated cart state.
    emit(ShoppingCart(items: items));
  }

  /// Removes a product from the cart or decreases its quantity.
  Future<void> removeProductFromCart(Product product) async {
    final items = state.items;

    // Find the existing cart item for the product.
    final existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ShoppingCartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity > 1) {
      // Decrease the quantity of the existing item.
      existingItem.quantity--;
      await db.updateCartItem(existingItem);
    } else {
      // Remove the item from the cart if quantity is 1 or less.
      items.remove(existingItem);
      await db.deleteCartItem(existingItem.product.id);
    }
    // Emit the updated cart state.
    emit(ShoppingCart(items: items));
  }

  /// Logs state changes for debugging purposes.
  @override
  void onChange(Change<ShoppingCart> change) {
    super.onChange(change);
    print(change.toString());
  }

  /// Logs errors for debugging purposes.
  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
