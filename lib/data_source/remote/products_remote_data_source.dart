import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constants.dart';
import '../../core/errors/server_exception.dart';
import '../../models/products/product.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Product>> loadProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Future<List<Product>> loadProducts() async {
    final url = Uri.parse(baseUrlString);

    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return (json.decode(response.body)['products'] as List<dynamic>)
              .map((e) => Product.fromJson(e))
              .toList();
        case >= 400 && <= 500:
          throw ServerException(
              errorMessage:
                  'Server Error - Code: ${response.statusCode}. \nFailed to load products.');

        default:
          throw const ServerException(errorMessage: 'Unknown Error.');
      }
    } catch (error) {
      if (error is ServerException) rethrow;
      throw 'Client Error. \nMost probably there is no internet. \nCheck your phone settings and after retry again.';
    }
  }
}
