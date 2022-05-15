// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_field

import 'dart:ui';
import 'package:flutter/services.dart';

import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _testResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //This is the AppBar
      appBar: AppBar(
        title: Text("BMI Calculator"),
        titleTextStyle:
            TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      //This is the body of the app
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.6),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.6),
                      ),
                    ),
                  ),
                )
              ],
            ),

            //This is the calculate button
            SizedBox(
              height: 30,
            ),
            //A sized box is used to give spaces between the widgets.
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                setState(() {
                  _bmiResult = _w / (_h * _h);

                  if (_bmiResult > 25) {
                    _testResult = "You're over weight!";
                  } else if (_bmiResult <= 25 && _bmiResult >= 18.5) {
                    _testResult = "You have a normal weight";
                  } else if (_bmiResult < 19) {
                    _testResult = "You're under weight!";
                  }
                });
              },
              child: Text("Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor)),
            ),

            //This is the field that displays the result.
            SizedBox(
              height: 50,
            ),

            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 90,
                    color: accentHexColor,
                  )),
            ),

            SizedBox(
              height: 50,
            ),

            Visibility(
              visible: _testResult.isNotEmpty,
              child: Container(
                child: Text(_testResult,
                    style: TextStyle(
                      fontSize: 25,
                      color: accentHexColor,
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            RightBar(barWidth: 70),
            SizedBox(height: 50),
            RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }

  Future hideNavigationBar() async {}
}
