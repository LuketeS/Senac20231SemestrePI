import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final result = await http
        .post(loginUrl, body: {'username': username, 'password': password});

    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }

  Future getAllProducts() async {
    final allProductsUrl = Uri.parse('https://fakestoreapi.com/products');
    final result = await http.get(allProductsUrl);

    return json.decode(result.body);
  }

  Future userRegister(User user) async {
    final userUrl = Uri.parse('https://fakestoreapi.com/users');
    final result = await http.post(userUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': user.email,
          'username': user.nickname,
          'password': user.password,
          'name': {'firstname': user.firstname, 'lastname': user.lastname},
          'address': {
            'city': user.city,
            'street': user.street,
            'number': 1,
            'zipcode': user.zipcode,
            'geolocation': {'lat': user.lat, 'long': user.long}
          },
          'phone': user.phone
        }));

    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }
}

class User {
  final String nickname;
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final String phone;
  final String lat;
  final String long;

  User(
      this.nickname,
      this.email,
      this.password,
      this.firstname,
      this.lastname,
      this.city,
      this.street,
      this.number,
      this.zipcode,
      this.phone,
      this.lat,
      this.long);

  @override
  String toString() {
    return 'User{nick: $nickname ,email: $email ,senha: $password ,pnome: $firstname ' +
        ', lnome: $lastname ,cidade: $city, rua: $street, numero: $number, zip: ' +
        '$zipcode, cell: $phone , lat: $lat, long: $long}';
  }
}
