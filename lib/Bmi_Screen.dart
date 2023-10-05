import 'dart:math';

import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:bmi_calculator/age_weight_widget.dart';
import 'package:bmi_calculator/gender_widget.dart';
import 'package:bmi_calculator/height_widget.dart';
import 'package:bmi_calculator/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: kprimaryRed,
          centerTitle: true,
          title: const Text("BMI Calculator"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                // padding: const EdgeInsets.all(12),
                child: Card(
                  elevation: 12,
                  shape: const RoundedRectangleBorder(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Lets create widget for gender selection
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GenderWidget(
                          onChange: (genderVal) {
                            _gender = genderVal;
                          },
                        ),
                      ),
                      HeightWidget(
                        onChange: (heightVal) {
                          _height = heightVal;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AgeWeightWidget(
                              onChange: (ageVal) {
                                _age = ageVal;
                              },
                              title: "Age",
                              initValue: 30,
                              min: 0,
                              max: 100),
                          AgeWeightWidget(
                              onChange: (weightVal) {
                                _weight = weightVal;
                              },
                              title: "Weight(Kg)",
                              initValue: 50,
                              min: 0,
                              max: 200)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 60),
                        child: SwipeableButtonView(
                            isFinished: _isFinished,
                            onFinish: () async {
                              await Navigator.push(
                                  context,
                                  PageTransition(
                                      child: ScoreScreen(
                                        bmiScore: _bmiScore,
                                        age: _age,
                                      ),
                                      type: PageTransitionType.fade));
            
                              setState(() {
                                _isFinished = false;
                              });
                            },
                            onWaitingProcess: () {
                              //Calculate BMI here
                              calculateBmi();
            
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  _isFinished = true;
                                });
                              });
                            },
                            activeColor: kprimaryRed,
                            buttonWidget: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                            ),
                            buttonText: "CALCULATE"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

void calculateBmi() async {
  _bmiScore = _weight / pow(_height / 100, 2);
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('bmi', _bmiScore);
}
}
