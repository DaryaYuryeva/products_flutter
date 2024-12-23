import '../products/product.dart';

class ShoppingCartItem {
  final Product product;
  final int quantity;

  const ShoppingCartItem({
    required this.product,
    required this.quantity,
  });
}