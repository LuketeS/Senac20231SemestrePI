import 'package:ecommerce_test/all_categories.dart';
import 'package:ecommerce_test/service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameCont = TextEditingController(text: 'mor_2314');
  TextEditingController passwordCont = TextEditingController(text: '83r5^_');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter Shop'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: usernameCont,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: passwordCont,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  final getToken = await ApiService()
                      .userLogin(usernameCont.text, passwordCont.text);

                  if (getToken['token'] != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Login Success')));

                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return AllCategories();
                      }));
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Incorrect Username or Password')));
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
