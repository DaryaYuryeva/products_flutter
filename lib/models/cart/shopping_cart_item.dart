import '../products/product.dart';

/// A model class representing an item in a shopping cart.
///
/// The [ShoppingCartItem] class contains a [Product] and its associated quantity
/// in the shopping cart. This class is used to manage the items that the user
/// adds to their cart, including the product details and the quantity of that product.
class ShoppingCartItem {
  Product product;
  int quantity;

  ShoppingCartItem({
    required this.product,
    required this.quantity,
  });

  /// Converts the [ShoppingCartItem] instance into a map of key-value pairs.
  Map<String, dynamic> toMap() {
    final map = product.toMap();
    map['quantity'] = quantity;

    return map;
  }

  /// A factory constructor to create a [ShoppingCartItem] from a map of key-value pairs.
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

  /// Returns a string representation of the [ShoppingCartItem] object.
  ///
  /// The returned string includes the product details and the quantity of the item,
  /// which is useful for debugging and logging purposes.
  @override
  String toString() {
    return 'ShoppingCartItem - { PRODUCT: $product, QUANTITY: $quantity }';
  }
}