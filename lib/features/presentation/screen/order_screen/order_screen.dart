import 'package:agro_mart/features/data/remote_cart_data_function.dart';
import 'package:agro_mart/features/domain/entities/order_entity.dart';
import 'package:agro_mart/features/presentation/screen/order_screen/widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../order_placed_screen/order_placed_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen(
      {Key? key,
      required this.imageNumber,
      required this.price,
      required this.imageName,
      required this.userId})
      : super(key: key);
  final int imageNumber;
  final int price;
  final String imageName;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
          widthFactor: 5,
          child: Text(
            'Order',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: OrderImage(
              name: imageName,
              price: price,
              productImageNumber: imageNumber,
              userId: userId,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderPlacedScreen(
                          productImageNumber: imageNumber.toString(),
                          userId: userId,
                          productQuantity: 1,
                          productPrice: price,
                          productName: imageName,
                        )),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
              child: Card(
                // height: 30,
                color: Colors.teal,
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Click to Buy",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: _addToCart,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
              child: Card(
                // height: 30,
                color: Colors.teal,
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addToCart() async {
    OrderEntity order = OrderEntity(
      productName: imageName,
      productPrice: price,
      productQuantity: 1,
      productImageNumber: imageNumber.toString(),
      userId: userId,
    );
    bool added = await addedToCart(order);
    if (added == true) {
      Future.delayed(const Duration(seconds: 0), () {
        Fluttertoast.showToast(
            msg: "Added to cart successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } else {
      Future.delayed(const Duration(seconds: 0), () {
        Fluttertoast.showToast(
            msg: "Something went wrong ",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }
}
