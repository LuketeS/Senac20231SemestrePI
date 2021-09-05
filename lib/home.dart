import 'package:ecommerce_test/all_categories.dart';
import 'package:ecommerce_test/products_detail.dart';
import 'package:ecommerce_test/service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
              icon: Icon(Icons.view_list),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AllCategories();
                }));
              })
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiService().getAllPosts(),
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
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
