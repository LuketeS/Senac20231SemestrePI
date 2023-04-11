import 'package:echostore/src/repositories/produto_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final repository = ProdutoRepository();
  test('deve trazer uma lista de produtosmodel', () async {
    final list = await repository.fetchProdutos();
    print(list);
  });
}
