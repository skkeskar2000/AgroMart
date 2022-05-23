import 'package:agro_mart/features/data/remote_order_data_function.dart';
import 'package:agro_mart/features/domain/entities/order_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen(
      {Key? key,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productImageNumber,
      required this.userId})
      : super(key: key);

  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productImageNumber;
  final String userId;

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  bool _loading = false;

  void _onLoading() {
    setState(() {
      _loading = true;
    });
  }

  Future _stopIndicator() async {
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState(){
    _onLoading();
    _isOrderPlace();
    super.initState();
  }

  Future<void> _isOrderPlace()async{
    OrderEntity order = OrderEntity(
      productName: widget.productName,
      productPrice: widget.productPrice,
      productQuantity: widget.productQuantity,
      productImageNumber: widget.productImageNumber,
      userId: widget.userId,
    );

    bool orderConform = await orderPlaced(order) ;

    if(orderConform){
      Future.delayed(const Duration(seconds: 2), _stopIndicator);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading ? bodyProgress() : body(),
    );
  }

  goBack() {
    int count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == 2;
    });
  }

  bodyProgress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 40.0,
            width: 40.0,
            child: const CircularProgressIndicator(
              strokeWidth: 5.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Center(
          child: Text(
            "Waiting For Conformation ..",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  body() {
    Future.delayed(const Duration(seconds: 2), goBack);
    return const Center(
      child: Text(
        "Thank Your order Is placed",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
