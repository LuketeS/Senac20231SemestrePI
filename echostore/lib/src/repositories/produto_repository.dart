import 'package:dio/dio.dart';
import 'package:echostore/src/models/produto_model.dart';

class ProdutoRepository {
  final dio = Dio();
  final url = 'https://fakestoreapi.com/products';

  Future<List<ProdutoModel>> fetchProdutos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<ProdutoModel> produtos = [];
    for (var json in list) {
      final produto = ProdutoModel.fromJson(json);
      produtos.add(produto);
    }

    return produtos;
  }
}
