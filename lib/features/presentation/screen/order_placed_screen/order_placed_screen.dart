import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  bool _loading = false;

  void _onLoading() {
    setState(() {
      _loading = true;
      Future.delayed(const Duration(seconds: 4), _stopIndicator);
    });
  }

  Future _stopIndicator() async {
    setState(() {
      _loading = false;
      Future.delayed(const Duration(seconds: 2), goBack);
    });
  }

  @override
  void initState() {
    _onLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading ? bodyProgress() : body(),
    );
  }

  goBack(){
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
