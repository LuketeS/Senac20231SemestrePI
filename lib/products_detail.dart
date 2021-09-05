import 'package:ecommerce_test/service.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final int id;
  const ProductDetails(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: ApiService().getSingleProduct(id),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Image.network(
                        snapshot.data['image'],
                        height: 200,
                        width: double.infinity,
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          '\$' + snapshot.data['price'].toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        snapshot.data['title'],
                        style: TextStyle(fontSize: 25),
                      ),
                      Chip(
                        label: Text(
                          snapshot.data['category'].toString(),
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        backgroundColor: Colors.blueGrey,
                      ),
                      SizedBox(height: 30),
                      Text(snapshot.data['description'])
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
