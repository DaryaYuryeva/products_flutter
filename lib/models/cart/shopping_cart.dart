import 'shopping_cart_item.dart';

class ShoppingCart {
  List<ShoppingCartItem> items;

  ShoppingCart({
    required this.items,
  });

  factory ShoppingCart.empty() {
    return ShoppingCart(items: []);
  }

  @override
  String toString() {
    return '$items';
  }
}
