class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final String thumbnail;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'],
    );
  }

  @override
  String toString() {
    return 'id: $id, title: $title';
  }
}
