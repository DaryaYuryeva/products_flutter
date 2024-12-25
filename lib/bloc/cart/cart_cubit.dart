import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_source/local/cart_local_database.dart';
import '../../models/cart/shopping_cart.dart';
import '../../models/cart/shopping_cart_item.dart';
import '../../models/products/product.dart';

class CartCubit extends Cubit<ShoppingCart> {
  final CartLocalDatabase db;

  CartCubit(this.db) : super(ShoppingCart.empty()) {
    _loadCartFromDatabase();
  }

  Future<void> _loadCartFromDatabase() async {
    final items = await db.getCartItems();
    emit(ShoppingCart(items: items));
  }

  Future<void> addProductToCart(Product product) async {
    final items = state.items;

    final existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ShoppingCartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      final newItem = ShoppingCartItem(product: product, quantity: 1);
      items.add(newItem);
      await db.addCartItem(newItem);
    } else {
      existingItem.quantity++;
      await db.updateCartItem(existingItem);
    }

    emit(ShoppingCart(items: items));
  }

  Future<void> removeProductFromCart(Product product) async {
    final items = state.items;

    final existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ShoppingCartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity > 1) {
      existingItem.quantity--;
      await db.updateCartItem(existingItem);
    } else {
      items.remove(existingItem);
      await db.deleteCartItem(existingItem.product.id);
    }
    emit(ShoppingCart(items: items));
  }

  @override
  void onChange(Change<ShoppingCart> change) {
    super.onChange(change);
    print(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
