import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future getAllPosts() async {
    final allProductsUrl = Uri.parse('https://fakestoreapi.com/products');
    final result = await http.get(allProductsUrl);

    return json.decode(result.body);
  }

  Future getSingleProduct(int id) async {
    final singleProd = Uri.parse('https://fakestoreapi.com/products/$id');
    final result = await http.get(singleProd);

    return json.decode(result.body);
  }

  Future getAllCategory() async {
    final allCat = Uri.parse('https://fakestoreapi.com/products/categories');
    final result = await http.get(allCat);

    return json.decode(result.body);
  }

  Future getProducts(String cat) async {
    final getProducts =
        Uri.parse('https://fakestoreapi.com/products/category/$cat');
    final result = await http.get(getProducts);

    return json.decode(result.body);
  }

  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final result = await http
        .post(loginUrl, body: {'username': username, 'password': password});

    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }
}
