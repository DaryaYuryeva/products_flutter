import '../products/product.dart';

class ShoppingCartItem {
  Product product;
  int quantity;

  ShoppingCartItem({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    final map = product.toMap();
    map['quantity'] = quantity;

    return map;
  }

  factory ShoppingCartItem.fromMap(Map<String, dynamic> map) {
    final product = Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      images: map['images'].split(','),
      thumbnail: map['thumbnail'],
    );

    return ShoppingCartItem(product: product, quantity: map['quantity']);
  }

  @override
  String toString() {
    return 'ShoppingCartItem - { PRODUCT: $product, QUANTITY: $quantity }';
  }
}