import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/main_2.dart';

class BMI_SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<BMI_SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BMI_FrontPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BMI_logo());
  }
}

class BMI_logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlueAccent,

        child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [

          Center(
            child:BMI_Logo1(),
          ),
          BMI_Logo2()
        ]));
  }
}

class BMI_Logo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Text('BMI',
    style: TextStyle(
    fontFamily: 'prince',
    fontSize: 80,
    color: Colors.black87,
    ));
  }

}

class BMI_Logo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('calculator',
        style: TextStyle(
          fontFamily: 'raj',
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ));
  }
}
