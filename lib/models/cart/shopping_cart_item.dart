import '../products/product.dart';

class ShoppingCartItem {
  Product product;
  int quantity;

  ShoppingCartItem({
    required this.product,
    required this.quantity,
  });

  @override
  String toString() {
    return 'product: $product, quantity: $quantity ;';
  }
}