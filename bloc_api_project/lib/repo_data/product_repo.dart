import 'package:http/http.dart' as http;

import '../model/product_api_model.dart';

class ProductsRepo {
  Future<List<Product>> getProducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final product = productFromJson(response.body);
      return product;
    } else {
      throw Exception("Failed to load product");
    }
  }
}
