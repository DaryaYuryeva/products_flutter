import 'product.dart';

class Products {
  final List<Product> productList;

  const Products({
    required this.productList,
  });

  factory Products.empty() {
    return const Products(productList: []);
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productList: List.from(json['products'] ?? []),
    );
  }
}
