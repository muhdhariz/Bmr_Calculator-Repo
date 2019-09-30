import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String bmrEq = '', gender = '', rBmrEq = '', sBmr = '', output = '';
  Color cGenderM, cGenderF, defaultC, cEqM, cEqH;
  double bmr = 0.0, height = 0.0, weight = 0.0;
  int age = 0, s = 0;
  TextEditingController _age = TextEditingController(),
      _height = TextEditingController(),
      _weight = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMR Calculator',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            'BMR Calculator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    width: 270,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gender:',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 45,
                        width: 130,
                        child: RaisedButton(
                            child: Text('Male'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: cGenderM,
                            onPressed: () {
                              setState(() {
                                gender = 'Male';
                                cGenderM = Colors.blueAccent;
                                cGenderF = defaultC;
                              });
                            }),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: RaisedButton(
                            child: Text('Female'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: cGenderF,
                            onPressed: () {
                              setState(() {
                                gender = 'Female';
                                cGenderF = Colors.blueAccent;
                                cGenderM = defaultC;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 270,
                    child: Text(
                      'BMR Equation:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 45,
                        width: 130,
                        child: RaisedButton(
                          child: Text('Mifflin - St Jeor'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: cEqM,
                          onPressed: () {
                            setState(() {
                              bmrEq = 'Mifflin - St Jeor';
                              cEqM = Colors.blueAccent;
                              cEqH = defaultC;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: RaisedButton(
                          child: Text('Harris-Benedict'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: cEqH,
                          onPressed: () {
                            setState(() {
                              bmrEq = 'Harris-Benedict';
                              cEqH = Colors.blueAccent;
                              cEqM = defaultC;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 35,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Age:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        alignment: Alignment.centerRight,
                        child: TextField(
                          controller: _age,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            labelText: "Enter your Age",
                            alignLabelWithHint: true,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 35,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Height:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 130,
                        child: TextField(
                          controller: _height,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            labelText: "Enter your Height",
                            alignLabelWithHint: true,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        height: 35,
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'cm',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 35,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Weight:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 130,
                        child: TextField(
                          controller: _weight,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            labelText: "Enter your Weight",
                            alignLabelWithHint: true,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        height: 35,
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'kg',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 20, 50.0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 200,
                        child: Text(
                          'Please select your activity : ',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        width: 40,
                        child: Text('Reset'),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Text(
                          'Enter',
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 190,

                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            icon: Icon(Icons.redo),
                            onPressed: _onClear
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            icon: Icon(Icons.play_arrow),
                            onPressed: _calculate
                        ),
                      ),
                    ],
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                  'Reset'
                              ),
                            ),

                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                'Enter',
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: Row(
                          children: <Widget>[
                            Center(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: IconButton(
                                        icon: Icon(Icons.redo),
                                        onPressed: _onClear
                                    ),
                                  ),

                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: IconButton(
                                        icon: Icon(Icons.play_arrow),
                                        onPressed: _calculate
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),*/

                /*Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                                'Reset'
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(
                                icon: Icon(Icons.redo),
                                onPressed: _onClear
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'Enter',
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(
                                icon: Icon(Icons.play_arrow),
                                onPressed: _calculate
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculate() {
    age = int.parse(_age.text);
    weight = double.parse(_weight.text);
    height = double.parse(_height.text);
    if (bmrEq == 'Mifflin - St Jeor') {
      if (gender == 'Male') {
        setState(() {
          bmr = 10.0 * weight + 6.25 * height - 5.0 * age + 5.0;
          outputTF();
        });
      } else {
        setState(() {
          bmr = 10.0 * weight + 6.25 * height - 5.0 * age - 161.0;
          outputTF();
        });
      }
    } else {
      if (gender == 'Male') {
        setState(() {
          bmr = 66.5 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
          outputTF();
        });
      } else {
        setState(() {
          bmr = 655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
          outputTF();
        });
      }
    }
  }

  void _onClear() {
    setState(() {
      gender = '';
      bmr = 0.0;
      output = '';
      cEqM = defaultC;
      bmrEq = '';
      cEqH = defaultC;
      cGenderF = defaultC;
      cGenderM = defaultC;
      _age.text = "";
      _height.text = "";
      _weight.text = "";
    });
  }

  void outputTF() {
    setState(() {
      output = 'Your BMR is \n' + bmr.toString() + '  kcal/day';
    });
  }
}
