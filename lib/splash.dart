import 'package:ecommerce/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class spPage extends StatefulWidget {
  @override
  _spPageState createState() => _spPageState();
}

class _spPageState extends State<spPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: LoginPage(),
        title: new Text(
          "E-ticaret'e Hoşgeldiniz!",
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.asset("assets/images/qwe.gif"),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: Colors.black);
  }
}
