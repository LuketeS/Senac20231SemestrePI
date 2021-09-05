import 'package:ecommerce_test/products_detail.dart';
import 'package:ecommerce_test/service.dart';
import 'package:flutter/material.dart';

class CategoryWise extends StatelessWidget {
  final String categoryName;
  const CategoryWise({key, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toString()),
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiService().getProducts(categoryName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (
                  context,
                  index,
                ) {
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    subtitle: Text("Price - \$" +
                        snapshot.data[index]['price'].toString()),
                    onTap: () {
                      Navigator.push(context,
                          // ignore: missing_return
                          MaterialPageRoute(builder: (context) {
                        return ProductDetails(snapshot.data[index]['id']);
                      }));
                    },
                  );
                },
                itemCount: snapshot.data.length,
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
