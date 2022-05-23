import 'package:agro_mart/features/data/remote_order_data_function.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var orderList = [];
  var length = 0;

  @override
  void initState() {
    getAllOrders();
    super.initState();
  }

  void getAllOrders() async {
    orderList = await getAllOrder(widget.userId);
    setState(() {
      length = orderList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return orderList.isEmpty
        ? const Center(child: Text("You Have Not Order Anything"),)
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
        return SafeArea(
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
                        "assets/images/body_images/${orderList[index]["productImageNumber"]}.jpeg"),
                  ),
                ),
                title: Text(orderList[index]["productName"]),
                subtitle: Text("Price : ₹${orderList[index]["productPrice"]}"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
