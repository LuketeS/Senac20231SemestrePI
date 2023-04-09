import 'package:echo_project/home.dart';
import 'package:flutter/material.dart';
import 'package:echo_project/service.dart';

class Register extends StatelessWidget {
  final TextEditingController _nickControl = TextEditingController();
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();
  final TextEditingController _firstnameControl = TextEditingController();
  final TextEditingController _lastnameControl = TextEditingController();
  final TextEditingController _zipControl = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
              controller: _nickControl,
              decoration: InputDecoration(labelText: 'Apeliddo')),
          TextField(
              controller: _emailControl,
              decoration: InputDecoration(labelText: 'Email ')),
          TextField(
              controller: _passwordControl,
              decoration: InputDecoration(labelText: 'Senha')),
          TextField(
              controller: _firstnameControl,
              decoration: InputDecoration(labelText: 'Nome')),
          TextField(
              controller: _lastnameControl,
              decoration: InputDecoration(labelText: 'Sobrenome')),
          TextField(
              controller: _zipControl,
              decoration: InputDecoration(labelText: 'CEP')),
          TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'Cidade')),
          TextField(
              controller: _streetController,
              decoration: InputDecoration(labelText: 'Rua')),
          TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Número')),
          TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Celular')),
          ElevatedButton(
            child: Text('Cadastrar'),
            onPressed: () async {
              final String nickname = _nickControl.text;
              final String email = _emailControl.text;
              final String password = _passwordControl.text;
              final String firstname = _firstnameControl.text;
              final String lastname = _lastnameControl.text;
              final String city = _cityController.text;
              final String street = _streetController.text;
              final int number = int.tryParse(_numberController.text);
              final String zipcode = _zipControl.text;
              final String phone = _phoneController.text;

              final User newUser = User(
                  nickname,
                  email,
                  password,
                  firstname,
                  lastname,
                  city,
                  street,
                  number,
                  zipcode,
                  phone,
                  "37.3159",
                  "37.3159"); //geolocation
              print(newUser);

              final userGet = await ApiService().userRegister(newUser);

              if (userGet['id'] != null) {
                print("foi");
                SnackBar snackBar = SnackBar(
                  content: Text("usuario criado"),
                  duration: Duration(seconds: 3),
                  backgroundColor: Theme.of(context).primaryColor,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                });
              } else {
                print("não foi");
                SnackBar snackBar = SnackBar(
                  content: Text("Erro: tente novamente mais tarde"),
                  duration: Duration(seconds: 3),
                  backgroundColor: Theme.of(context).primaryColor,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          )
        ],
      ),
    );
  }
}
