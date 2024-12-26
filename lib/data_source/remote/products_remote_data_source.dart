import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constants.dart';
import '../../core/errors/server_exception.dart';
import '../../models/products/product.dart';

/// An abstract class defining the contract for loading products from a remote source.
abstract class ProductsRemoteDataSource {
  Future<List<Product>> loadProducts();
}

/// The implementation of abstract class that handles fetching products
/// from a remote API via HTTP.
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Future<List<Product>> loadProducts() async {
    // Constructing the URL for the API request.
    final url = Uri.parse(baseUrlString);

    try {
      // Sending a GET request to the remote server to fetch products.
      final response = await http.get(url);

      // Handling different HTTP status codes.
      switch (response.statusCode) {
        case 200:
          // Successful response: Parsing the response body into a list of products.
          return (json.decode(response.body)['products'] as List<dynamic>)
              .map((e) => Product.fromJson(e))
              .toList();

        case >= 400 && <= 500:
          // Server error response (4xx - 5xx): Throwing a ServerException with a message and error code.
          throw ServerException(
            errorMessage: 'Failed to load products.',
            errorCode: response.statusCode,
          );

        default:
          // Unknown error response: Throwing a ServerException.
          throw ServerException(
            errorMessage: 'Unknown Error.',
            errorCode: response.statusCode,
          );
      }
    } catch (error) {
      // Catching any errors (e.g., no internet connection).
      // If caught a ServerException, then rethrow it.
      // Else, throwing a custom error message.
      if (error is ServerException) rethrow;
      throw 'Error. \nCheck your internet connection \nand after try again.';
    }
  }
}
