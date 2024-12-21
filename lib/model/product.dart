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
    return switch (json) {
      {
        'id': int id,
        'title': String title,
        'description': String description,
        'price': double price,
        'images': List<String> images,
        'thumbnail': String thumbnail,
      } =>
        Product(
          id: id,
          title: title,
          description: description,
          price: price,
          images: images,
          thumbnail: thumbnail,
        ),
      _ => throw const FormatException('Failed to load products fromJson.'),
    };
  }
}
