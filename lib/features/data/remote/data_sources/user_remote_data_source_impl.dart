import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:agro_mart/features/data/remote/data_sources/user_remote_data_source.dart';
import 'package:agro_mart/features/domain/entities/user_entity.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  @override
  Future<String> loggedIn(UserEntity user) async{
    try{
      final data = jsonEncode({
        'email': user.gmail,
        'password': user.password,
      });
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '<Your token>'
      };
      var url = Uri.parse('http://10.0.2.2:5000/auth/login');
      var response = await http.post(url ,headers:headers , body: data);
      print(response.statusCode);
      if(response.statusCode == 200){
        String userData = response.body;
        return jsonDecode(userData);
      }
      else{
        return response.statusCode.toString();
      }
    }catch(error){
      return error.toString();
    }
    // return jsonDecode(data);
  }

  @override
  Future<void> loggedOut() {

    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signIn(UserEntity user) {

    throw UnimplementedError();
  }

}