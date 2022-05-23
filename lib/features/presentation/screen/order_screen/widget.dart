import 'package:flutter/material.dart';

import 'order_screen.dart';

class OrderImage extends StatelessWidget {
  OrderImage({required this.name, required this.price, required this.productImageNumber, required this.userId});

  final String name;
  final String price;
  final int productImageNumber;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.all(20.0),
          height: 250.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/body_images/$productImageNumber.jpeg",
              ),
              fit: BoxFit.cover,
            ),
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(color: Colors.black26),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text("₹$price"),
          ],
        ),
      ],
    );
  }
}
