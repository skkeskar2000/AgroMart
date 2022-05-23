import 'package:agro_mart/features/data/remote_data_function.dart';
import 'package:agro_mart/features/presentation/pages/home_page.dart';
import 'package:agro_mart/features/presentation/screen/Signup/signup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/entities/user_entity.dart';
import '../widgets/already_have_an_account_check.dart';
import '../widgets/round_password_field.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String gmail = "", password = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  gmail = value;
                },
              ),
              RoundedPasswordField(
                hintText: "Password",
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                onPressed: _onPressedLogin,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedLogin() async {
    if(gmail.isNotEmpty && password.isNotEmpty){
      UserEntity user = await loggedIn(gmail, password);
      if (user.id != null && user.gmail == gmail) {
        navigateHomeScreen(user.id!, user.name, user.gmail);
      } else {
        Future.delayed(const Duration(seconds: 0), () {
          Fluttertoast.showToast(
              msg: user.name,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }
    }
    else {
      Future.delayed(const Duration(seconds: 0), () {
        Fluttertoast.showToast(
            msg: "Field is empty",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }

  void navigateHomeScreen(String id, String name, String gmail) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage(
            name: name,
            userId: id,
          );
        },
      ),
    );
  }
}
