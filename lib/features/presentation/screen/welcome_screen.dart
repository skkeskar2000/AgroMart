import 'package:agro_mart/features/presentation/screen/Signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant.dart';
import '../widgets/rounded_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    const Text(
                      "WELCOME TO AGROMART",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                    ),
                    SizedBox(height: size.height * 0.05),
                    SvgPicture.asset(
                      "assets/icons/chat.svg",
                      height: size.height * 0.45,
                    ),
                    SizedBox(height: size.height * 0.05),
                    RoundedButton(
                      text: "LOGIN",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    RoundedButton(
                      text: "SIGN UP",
                      color: kPrimaryLightColor,
                      textColor: Colors.black,
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
        ),
      ),
    );
  }
}

class WelcomeBackgroundScreen extends StatelessWidget {
  final Widget child;
  const WelcomeBackgroundScreen(Key key,{
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
