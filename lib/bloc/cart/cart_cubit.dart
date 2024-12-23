import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart/shopping_cart.dart';
import '../../models/cart/shopping_cart_item.dart';

class CartCubit extends Cubit<ShoppingCart> {
  CartCubit() : super(ShoppingCart.empty());

  void addProductToCart(ShoppingCartItem item) {
    final cartItems = state.items;

    if (cartItems.contains(item)) {
      cartItems.map((e) {
        if (e.product == item.product) {
          e.quantity += 1;
        }
      },);
    } else {
      cartItems.add(item);
    }
    emit(ShoppingCart(items: cartItems));
  }

  void removeProductFromCart(ShoppingCartItem item) {
    final cartItems = state.items;

    if (cartItems.contains(item)) {
      cartItems.map((e) {
        if (e.product == item.product && e.quantity != 1) {
          e.quantity -= 1;
        } else {
          cartItems.remove(item);
        }
      });
    }

    emit(ShoppingCart(items: cartItems));
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
