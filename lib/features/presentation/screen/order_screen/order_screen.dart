import 'package:agro_mart/features/presentation/screen/order_screen/widget.dart';
import 'package:flutter/material.dart';

import '../order_placed_screen/order_placed_screen.dart';


class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key, required this.imageNumber, required this.price, required this.imageName}) : super(key: key);
  final int imageNumber;
  final String price;
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text(
            'Order',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: OrderImage(
                name: imageName,
                price: price,
                productImageNumber: imageNumber,
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPlacedScreen()),);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  // height: 30,
                  color: Colors.teal,
                  child: Center(child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Click to Buy",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
