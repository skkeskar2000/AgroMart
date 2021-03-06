import 'package:agro_mart/features/presentation/screen/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (BuildContext context) => WelcomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: "/",
      initialRoute: "/",
    );
  }
}
// void generateToken(String userId){
//   userToken = userId;
// }
