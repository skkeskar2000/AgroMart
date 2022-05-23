import 'package:agro_mart/features/data/remote_cart_data_function.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartList = [];
  var length = 0;

  @override
  void initState() {
    getAllCarts();
    super.initState();
  }

  void getAllCarts() async {
    cartList = await getAllCart(widget.userId);
    setState(() {
      length = cartList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return cartList.isEmpty
        ? const Center(
            child: Text("You don't anything in cart"),
          )
        : _buildListView();
  }

  ListView _buildListView() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      // physics: ScrollPhysics,
      reverse: true,
      itemCount: length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onLongPress: () {
            _onLongPress(index, widget.userId, cartList[index]["productName"]);
          },
          child: _cartListTile(index),
        );
      },
    );
  }

  Container _cartListTile(int index) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Container(
              color: Colors.black12,
              height: 100,
              width: 80,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/images/body_images/${cartList[index]["productImageNumber"]}.jpeg"),
              ),
            ),
            title: Text(cartList[index]["productName"]),
            subtitle: Text("Price : ₹${cartList[index]["productPrice"]}"),
            trailing: Column(
              children: [
                const Text("Quantity"),
                const SizedBox(
                  height: 8,
                ),
                Text(cartList[index]["productQuantity"]),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  void _onLongPress(index, userId, productName) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Do you want to delete"),
            content: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                const Expanded(
                  child: SizedBox(),
                ),
                TextButton(
                  onPressed: ()async{
                    bool delete = await _deleteCartItem(index, userId, productName);
                    if(delete){
                      setState((){
                        getAllCarts();
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Delete"),
                ),
              ],
            ),
          );
        });
  }
}

Future<bool> _deleteCartItem(int index, String userId, String productName,) async {
  bool delete = await deleteCartItem(userId, productName);
  return delete;
}
