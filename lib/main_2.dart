import 'package:flutter/material.dart';
import 'package:bmi_calculator/BMI_SplashScreen.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BMI_SplashScreen());
  }
}

class BMI_FrontPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BMI_FrontPage();
  }
}

class _BMI_FrontPage extends State<BMI_FrontPage> {
  var _width = 0.0;
  Color vsu = Colors.white;
  Color su = Colors.white;
  Color u = Colors.white;
  Color n = Colors.white;
  Color o = Colors.white;
  Color o1 = Colors.white;
  Color o2 = Colors.white;
  Color o3 = Colors.white;

  var _height = TextEditingController();
  var _weight = TextEditingController();
  var result;
  Color col = Colors.black;
  var ans;
  double indicator(var result) {
    if (result < 16) {
      _width = result * 6.25;
    } else if (result > 16 && result < 43) {
      _width = (result * 10) - 60;
    } else if (result >= 43) {
      _width = 370;
    }
    return _width;
  }

  void rang(var result) {
    if (result < 16) {
      vsu = Colors.blue.shade200;
    } else if (result >= 16 && result < 17) {
      su = Colors.blue.shade300;
    } else if (result >= 17 && result < 18.5) {
      u = Colors.blue.shade400;
    } else if (result >= 18.5 && result < 25) {
      n = Colors.green.shade300;
    } else if (result >= 25 && result < 30) {
      o = Colors.yellow.shade400;
    } else if (result >= 30 && result < 35) {
      o1 = Colors.amber.shade300;
    } else if (result >= 35 && result < 40) {
      o2 = Colors.orange.shade400;
    } else {
      o3 = Colors.red.shade300;
    }
  }
  var res1 = "0.0";
  var res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 50, bottom: 0, left: 10, right: 10),
            child: Container(
                // color:Colors.red,
                child: SingleChildScrollView(
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:40,
                      ),
                      Text('BMI calculator',
                          style: TextStyle(fontFamily: 'prince', fontSize: 30)),
                      InkWell(
                          child: Icon(Icons.refresh,size:30),
                          onTap: () {
                            vsu = Colors.white;
                            su = Colors.white;
                            u = Colors.white;
                            n = Colors.white;
                            o = Colors.white;
                            o1 = Colors.white;
                            o2 = Colors.white;
                            o3 = Colors.white;
                            col = Colors.black;
                            _width = 0.0;
                            result = 0;
                            res1 = "0.0";
                            _height.clear();
                            _weight.clear();
                            setState(() {});
                          })
                    ]),
                SizedBox(
                  height: 50,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Height',
                          style: TextStyle(
                              fontFamily: 'text3',
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
                      Container(
                          height: 30,
                          width: 100,
                          child: TextField(
                              textAlign: TextAlign.center,
                              controller: _height,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixText: "in Feet",
                                  suffixStyle: TextStyle(fontSize: 13))),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10))),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Weight',
                          style: TextStyle(
                              fontFamily: 'text3',
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      Container(
                          height: 30,
                          width: 100,
                          child: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _weight,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  suffixText: "in kg",
                                  suffixStyle: TextStyle(fontSize: 13)),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)))
                    ]),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    child: Text('Calculate'),
                    onPressed: () {
                      var ht = _height.text.toString();
                      var wt = _weight.text.toString();
                      if (ht != "" && wt != "") {
                        var iht = double.parse(ht);
                        var iwt = double.parse(wt);
                        int i = iht.floor();
                        double j = iht - i;
                        if (j < 10) {
                          j = j * 10;
                        } else if (j >= 10) {
                          j = j * 100;
                        }
                        ans = ((i * 12) + j) * (0.0254);
                        result = (iwt / (ans * ans));
                        _width = indicator(result);
                        res = result.toStringAsFixed(2);
                        res1 = res.toString();
                        col = Colors.black;
                      } else {
                        res1 = 'Please fill all the Requirements';
                        col = Colors.red;
                      }

                      setState(() {
                        vsu = Colors.white;
                        su = Colors.white;
                        u = Colors.white;
                        n = Colors.white;
                        o = Colors.white;
                        o1 = Colors.white;
                        o2 = Colors.white;
                        o3 = Colors.white;
                        rang(result);
                      });
                    }),
                SizedBox(height: 30),
                Stack(children: [
                  _row1(),
                  Positioned(
                      top: 16.5,
                      left: -19,
                      child: Row(children: [
                        AnimatedContainer(
                            duration: Duration(seconds: 2),
                            width: _width,
                            curve: Curves.decelerate),
                        Icon(Icons.arrow_drop_up, size: 40)
                      ]))
                ]),
                SizedBox(height: 20),
                Text('Your BMI is...',
                    style: TextStyle(
                        fontFamily: 'text3',
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                SizedBox(height: 15),
                Text('${res1}',
                    style: TextStyle(
                      fontFamily: 'BMI',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: col,
                    )),
                SizedBox(
                  height: 30,
                ),
                AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 30,
                    width: 380,
                    child: _row2(
                        Colors.indigo, 'Very Severely underweight', '<16.0'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: vsu,
                    )),
                SizedBox(
                  height:10
                ),

                AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 30,
                    width: 380,
                    child: _row2(Colors.indigoAccent, 'Severely underweight',
                        '16.0 - 16.9'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: su,
                    )),
                SizedBox(
                    height:10
                ),
                AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 30,
                    width: 380,
                    child: _row2(Colors.blue, 'Underweight', '17.0 - 18.4'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: u,
                    )),
                SizedBox(
                    height:10
                ),
                AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 30,
                    width: 380,
                    child:
                        _row2(Colors.green.shade500, 'Normal', '18.5 - 24.9'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: n,
                    )),
                SizedBox(
                    height:10
                ),
                AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 30,
                    width: 380,
                    child: _row2(Colors.yellow, 'Overweight', '25.0 - 29.9'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: o,
                    )),
                SizedBox(
                    height:10
                ),
                AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 30,
                    width: 380,
                    child: _row2(Colors.amber, 'Obese Class |', '30.0 - 34.9'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: o1,
                    )),
                SizedBox(
                    height:10
                ),
                AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 30,
                    width: 380,
                    child:
                        _row2(Colors.orange, 'Obese Class ||', '35.0 - 39.9'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: o2,
                    )),
                SizedBox(
                    height:10
                ),
                AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 30,
                    width: 380,
                    child: _row2(Colors.redAccent, 'Obese Class |||', '>=40'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: o3,
                    ))
              ]),
            ))));
  }
}

class _row1 extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Container(
      height: 40,
      width: 400,
      child: Row(children: [
        Container(
            width: 100,
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)))),
        Container(width: 10, color: Colors.indigoAccent),
        Container(width: 15, color: Colors.blue),
        Container(width: 65, color: Colors.green.shade500),
        Container(
          width: 50,
          color: Colors.yellow,
        ),
        Container(
          width: 50,
          color: Colors.amber,
        ),
        Container(
          width: 50,
          color: Colors.orange,
        ),
        Expanded(
        child:Container(
            // width: 50,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)))),
        ),
      ]),
    );
  }
}

class _row2 extends StatelessWidget {
  Color bgcolor;
  var text1;
  var text2;
  _row2(this.bgcolor, this.text1, this.text2);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(children: [
        Icon(Icons.circle, color: bgcolor, size: 15),
        SizedBox(width: 10),
        Text('$text1',
            style: TextStyle(
              fontFamily: 'text3',
              fontSize: 17,
              fontWeight: FontWeight.w500,
            )),
        Expanded(child: SizedBox()),
        Text('$text2',
            style: TextStyle(
              fontFamily: 'prince',
              fontSize: 15,
            )),
      ]),
    );
  }
}
