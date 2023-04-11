import 'package:echostore/src/models/produto_model.dart';
import 'package:echostore/src/repositories/produto_repository.dart';

class HomeController {
  List<ProdutoModel> produtos = [];
  final repository = ProdutoRepository();

  Future start() async {
    produtos = await repository.fetchProdutos();
  }
}
