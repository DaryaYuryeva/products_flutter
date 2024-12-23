import 'shopping_cart_item.dart';

class ShoppingCart {
  final List<ShoppingCartItem> items;

  const ShoppingCart({
    required this.items,
  });

  factory ShoppingCart.empty() {
    return const ShoppingCart(items: []);
  }
}
