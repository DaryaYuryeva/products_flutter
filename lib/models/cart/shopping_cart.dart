import 'shopping_cart_item.dart';

class ShoppingCart {
  List<ShoppingCartItem> items;

  ShoppingCart({
    required this.items,
  });

  /// A factory constructor to create an empty shopping cart.
  factory ShoppingCart.empty() {
    return ShoppingCart(items: []);
  }

  /// Returns a string representation of the [ShoppingCart] object.
  @override
  String toString() {
    return 'ShoppingCart - { $items }';
  }
}
