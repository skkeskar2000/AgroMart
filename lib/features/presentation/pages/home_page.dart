import 'package:agro_mart/constant.dart';
import 'package:agro_mart/features/presentation/pages/cart_page.dart';
import 'package:agro_mart/features/presentation/pages/like_page.dart';
import 'package:agro_mart/features/presentation/pages/order_page.dart';
import 'package:agro_mart/features/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/nav_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.name, required this.userId})
      : super(key: key);
  final String name;
  final String userId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String userId = widget.userId;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        userId: userId,
      ),
      LikePage(),
      CartPage(
        userId: userId,
      ),
      OrderPage(
        userId: userId,
      ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: index != 3
          ? NavDrawer(
              name: widget.name,
            )
          : null,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: index == 3
            ? const Text(
                'My Order',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : const Center(
                child: Text(
                  'AgroMart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
        leading: index == 3 ? const Icon(Icons.arrow_back) : null,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    userId: userId,
                  ),
                ),
              );
            },
            icon: Stack(
              children: [
                const FaIcon(
                  FontAwesomeIcons.shoppingCart,
                  color: Colors.white,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                        child: Text(
                      '3',
                      style: TextStyle(fontSize: 10.0),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: pages[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        elevation: 2.0,
        backgroundColor: kPrimaryColor,
        child: const FaIcon(
          FontAwesomeIcons.arrowUp,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: kPrimaryColor,
        notchMargin: 10,
        child: Container(
          color: Colors.teal,
          padding: const EdgeInsets.all(20.0),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  color: index == 0 ? Colors.white : Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: index == 1 ? Colors.white : Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: index == 2 ? Colors.white : Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Icon(
                  Icons.shopping_basket,
                  color: index == 3 ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
