import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constants.dart';
import '../../model/product.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Product>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {

  @override
  Future<List<Product>> getProducts() async {
    final url = Uri.parse(baseUrlString);
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        return (json.decode(response.body)['products'] as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load products.');
      }
    } catch (error) {
      throw Exception('Failed to load products. Error - ${error.toString()}');
    }
  }
}