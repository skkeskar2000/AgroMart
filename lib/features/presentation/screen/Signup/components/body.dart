import 'package:agro_mart/features/presentation/pages/home_page.dart';
import 'package:agro_mart/features/presentation/screen/Signup/components/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../data/remote_user_data_function.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../widgets/already_have_an_account_check.dart';
import '../../../widgets/round_password_field.dart';
import '../../../widgets/rounded_button.dart';
import '../../../widgets/rounded_input_field.dart';
import '../../home_screen.dart';
import '../../login_screen.dart';
import 'background.dart';
import 'or_divider.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String email,password,passwordVerify,name,phoneNo,address;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
              ),
              SizedBox(height: size.height * 0.08),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                hintText: "Password",
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedPasswordField(
                hintText: "Verify Password",
                onChanged: (value) {
                  passwordVerify = value;
                },
              ),
              RoundedInputField(
                hintText: "Enter Your Name",
                onChanged: (value) {
                  name = value;
                },
              ),
              RoundedInputField(
                hintText: "Enter Your Phone Number",
                onChanged: (value) {
                  phoneNo = value;
                },
              ),
              RoundedInputField(
                hintText: "Enter Your Address",
                onChanged: (value) {
                  address = value;
                },
              ),
              RoundedButton(
                text: "SIGNUP",
                onPressed: _isSignUp,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
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
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _isSignUp() async{
    UserEntity user = await signIn(email, password,passwordVerify,name,phoneNo,address);
    print(user.name);
    if(user.id != null && user.gmail == email){
      navigateHomeScreen(user.id!,user.name,user.gmail);
    }
    else{
      Future.delayed(const Duration(seconds: 0),(){
        Fluttertoast.showToast(
            msg: user.name,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });
    }
  }

  void navigateHomeScreen(String id, String name, String gmail){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage(name: name,userId: id,);
        },
      ),
    );
  }
}
