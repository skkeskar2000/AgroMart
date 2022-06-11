import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/entities/user_entity.dart';

//Login Rest API Function Which connect to the database
Future<UserEntity> loggedIn(String gmail, String password) async {
  try {
    final data = jsonEncode({
      'email': gmail,
      'password': password,
    });
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };
    // Create a LInk
    var url = Uri.parse('http://10.0.2.2:5000/auth/login');

    // Post api - Connect the server
    var response = await http.post(url, headers: headers, body: data);

    final userData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserEntity(
          userData['email'],
          userData['password'],
          userData['_id'],
          userData['name'],
          userData['phoneNo'],
          userData['address']);
    } else {
      return UserEntity("", "", "", userData['errorMessage'], "","");
    }
  } catch (error) {
    return UserEntity("", "", "", error.toString(), "","");
  }
}

//Login Rest API Function Which connect to the database
Future<UserEntity> signIn(String gmail, String password, String passwordVerify,
    String name, String phoneNo,String address) async {
  try {
    final data = jsonEncode({
      'email': gmail,
      'password': password,
      'passwordVerify': passwordVerify,
      'name': name,
      'phoneNo': phoneNo,
      'address' : address,
    });
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>'
    };
    var url = Uri.parse('http://10.0.2.2:5000/auth/');
    var response = await http.post(url, headers: headers, body: data);

    final userData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserEntity(userData['email'], userData['password'],
          userData['_id'], userData['name'], userData['phoneNo'],userData['address'],);
    } else {
      return UserEntity("", "", "", userData['errorMessage'], "","");
    }
  } catch (error) {
    return UserEntity(error.toString(), "", "", "", "","");
  }
}
