import 'package:agro_mart/features/presentation/pages/order_page.dart';
import 'package:agro_mart/features/presentation/screen/order_screen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import '../widgets/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';
  final String name;
  const HomeScreen({Key? key, required this.name}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavDrawer(name: widget.name,),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(
            child: Text(
              'AgroMart',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.push(context, new MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: Stack(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.shoppingCart,
                    color: Colors.black,
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
        body:   const HomePageBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          elevation: 2.0,
          backgroundColor: Colors.teal,
          child: const FaIcon(
            FontAwesomeIcons.arrowUp,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.teal,
          notchMargin: 10,
          child: Container(
            // color: Colors.teal,
            padding: const EdgeInsets.all(20.0),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Icon(
                  Icons.dashboard,
                ),
                Icon(
                  Icons.shopping_cart,
                ),
                Icon(Icons.contact_page),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Container(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.black38,
                    size: 30.0,
                  ),
                  hintText: 'Search product',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ReusedCircleAvatar(
                        recentName: 'Seeds',
                        roundImageNumber: 1,
                      ),
                      ReusedCircleAvatar(
                        recentName: 'Crop Protection',
                        roundImageNumber: 2,
                      ),
                      ReusedCircleAvatar(
                        recentName: 'Crop Nutrition',
                        roundImageNumber: 3,
                      ),
                      ReusedCircleAvatar(
                        recentName: 'Vegetables',
                        roundImageNumber: 4,
                      ),
                      ReusedCircleAvatar(
                        recentName: 'Dairy',
                        roundImageNumber: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'New Arrivals',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              FaIcon(
                FontAwesomeIcons.arrowRight,
                size: 20,
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: const [
                                ProductImage(
                                  name: 'Tomato Seed',
                                  price: '₹480',
                                  productImageNumber: 1,
                                ),
                                ProductImage(
                                  name: 'Sulphur Fertilizer',
                                  price: '₹250',
                                  productImageNumber: 2,
                                ),
                                ProductImage(
                                  name: 'Agri Implement',
                                  price: '₹2277',
                                  productImageNumber: 3,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: const [
                                ProductImage(
                                  name: 'Herbicide',
                                  price: '₹276',
                                  productImageNumber: 4,
                                ),
                                ProductImage(
                                  name: 'N53 Onion Seed',
                                  price: '₹861',
                                  productImageNumber: 5,
                                ),
                                ProductImage(
                                  name: 'Spiced Milk',
                                  price: '₹58',
                                  productImageNumber: 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({required this.name, required this.price, required this.productImageNumber});

  final String name;
  final String price;
  final int productImageNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ReusedImageContainer(
          imageName: name,
          price: price,
          imageNumber: productImageNumber,
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
            Text(price),
          ],
        ),
      ],
    );
  }
}

class ReusedCircleAvatar extends StatelessWidget {
  final String recentName;
  final int roundImageNumber;

  ReusedCircleAvatar({required this.recentName, required this.roundImageNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              print("sk");
            },
            child: Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/storyContainer/$roundImageNumber.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(recentName)
        ],
      ),
    );
  }
}

class ReusedImageContainer extends StatelessWidget {
  final int imageNumber;
  final String price;
  final String imageName;

  const ReusedImageContainer({required this.imageNumber, required this.price, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>  OrderScreen(imageNumber: imageNumber, price: price, imageName: imageName),),);
      },
      child: Container(
        height: 250.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/body_images/$imageNumber.jpeg",
            ),
            fit: BoxFit.cover,
          ),
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(color: Colors.black26),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 110.0, right: 15.0, bottom: 160.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: LikeButton(),
        ),
      ),
    );
  }
}
