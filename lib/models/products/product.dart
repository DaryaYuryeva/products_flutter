/// This class representing a product model.
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

  /// A factory constructor to create a [Product] from a JSON object.
  ///
  /// This constructor is used to parse the JSON response from an API or
  /// local storage and convert it into a [Product] object.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], // Extracting the product ID from the JSON
      title: json['title'], // Extracting the product title
      description: json['description'], // Extracting the product description
      price: json['price'], // Extracting the product price
      images: List<String>.from(json['images'] ??
          []), // Extracting the list of images (default empty if null)
      thumbnail: json['thumbnail'], // Extracting the product thumbnail
    );
  }

  /// Converts the [Product] instance into a map of key-value pairs.
  ///
  /// This method is useful for saving a product to a local database or converting
  /// it to a format suitable for an API request.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'images': images.join(','),
      'thumbnail': thumbnail,
    };
  }

  /// Returns a string representation of the [Product] object.
  @override
  String toString() {
    return 'Product - { id: $id, title: $title, description: $description, price: $price, images: $images, thumbnail: $thumbnail }';
  }
}
