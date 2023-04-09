import 'package:echo_project/register.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrando produto'),
        ),
        body: Column(
          children: <Widget>[
            TextField(),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Indo para login ^^')));
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
                  });
                },
                child: Text(
                  "LOGADO",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
