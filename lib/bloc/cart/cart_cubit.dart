import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart/shopping_cart.dart';
import '../../models/cart/shopping_cart_item.dart';
import '../../models/products/product.dart';

class CartCubit extends Cubit<ShoppingCart> {
  CartCubit() : super(ShoppingCart.empty());

  void addProductToCart(Product product) {
    final items = state.items;

    final existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ShoppingCartItem(product: product, quantity: 0),
    );

    existingItem.quantity == 0
        ? items.add(ShoppingCartItem(product: product, quantity: 1))
        : existingItem.quantity++;

    emit(ShoppingCart(items: items));
  }

  void removeProductFromCart(Product product) {
    final items = state.items;

    final existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => ShoppingCartItem(product: product, quantity: 0),
    );

    existingItem.quantity > 1
        ? existingItem.quantity--
        : items.remove(existingItem);

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
