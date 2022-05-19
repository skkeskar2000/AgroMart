import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/entities/user_entity.dart';

Future<UserEntity> loggedIn(String gmail,String password) async{
  try{
    final data = jsonEncode({
      'email': gmail,
      'password': password,
    });
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };
    var url = Uri.parse('http://10.0.2.2:5000/auth/login');
    // print(url);
    var response = await http.post(url ,headers:headers , body: data);
    // print("sk");
    // print(response.statusCode);
    final userData = jsonDecode(response.body);

    if(response.statusCode == 200){
      return UserEntity(
        userData['email'],
        userData['password'],
        userData['_id'],
        userData['name'],
        userData['phoneNo']
      );
    }
    else{
      return UserEntity("", "","",userData['errorMessage'],"");
    }
  }catch(error){
    return UserEntity("","","",error.toString(),"");
  }
}

Future<UserEntity> signIn(String gmail,String password,String passwordVerify,String name,String phoneNo)async{
  try{
    final data = jsonEncode({
      'email': gmail,
      'password': password,
      'passwordVerify' : passwordVerify,
      'name' : name,
      'phoneNo' : phoneNo,
    });
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>'
    };
    var url = Uri.parse('http://10.0.2.2:5000/auth/');
    var response = await http.post(url ,headers:headers , body: data);

    final userData = jsonDecode(response.body);
    if(response.statusCode == 200){
      return UserEntity(
          userData['email'],
          userData['password'],
          userData['_id'],
          userData['name'],
          userData['phoneNo']
      );
    }
    else{
      return UserEntity("", "","",userData['errorMessage'],"");
    }
  }catch(error){
    return UserEntity(error.toString(),"","","","");
  }
}