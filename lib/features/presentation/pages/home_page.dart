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
      const LikePage(),
      CartPage(
        userId: userId,
      ),
      OrderPage(
        userId: userId,
      ),
    ];
    DateTime lastExitTime = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastExitTime) >= const Duration(seconds: 2)) {
          //showing message to user
          const snack =  SnackBar(
            content:  Text("Press the back button again to exist the app"),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          lastExitTime = DateTime.now();
          return false; // disable back press
        } else {
          return true; //  exit the app
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: (index != 3 && index !=2)
            ? NavDrawer(
                name: widget.name,
              )
            : null,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: (index == 3 || index ==2)
              ? index == 3 ? appBarTittle('My Order') : appBarTittle('Cart')
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
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
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
      ),
    );
  }

  Text appBarTittle(String tittle) {
    return Text(
          tittle,
          style: const TextStyle(
            color: Colors.white,
          ),
        );
  }
}
