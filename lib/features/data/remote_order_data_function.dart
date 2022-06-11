import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/entities/order_entity.dart';

//Order Conformation Api
Future<bool> orderPlaced (OrderEntity order)async{

  try{
    final orderData = jsonEncode({
      'productName': order.productName,
      'productPrice': order.productPrice,
      'productQuantity': order.productQuantity,
      'productImageNumber': order.productImageNumber,
      'userId': order.userId,
    });
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };
    var url = Uri.parse('http://10.0.2.2:5000/order/');

    var response = await http.post(url,body: orderData,headers: headers);

    print(response.statusCode);
    // final userData = jsonDecode(response.body);

    return true;
  }catch(error){
    print(error);
    return false;
  }
}


//Get All Order API
Future<List<dynamic>> getAllOrder(String userId)async{
  try{
      final params = {
        'userId' : userId,
      };

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '<Your token>',
    };
    var url = Uri.parse('http://10.0.2.2:5000/order/getOrder');
    final newURI = url.replace(queryParameters: params);
    final response = await http.get(newURI,headers: headers);
    var orderList = jsonDecode(response.body) as List;
    return orderList;
  }catch(error){
    return [error];
  }
}