import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:bmi_calculator/DietPlan/DietPlan.dart';
import 'package:bmi_calculator/Home/Home.dart';
import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:bmi_calculator/Yoga_plans/yoga_plans.dart';
import 'package:bmi_calculator/Bmi_Screen.dart';
import 'package:bmi_calculator/stopwatch/stopwatch.dart';
import 'package:bmi_calculator/yoga_trainer/yoga_trainer2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Tabbarr extends StatelessWidget {
    static const routeName = '/tabarr';
  const Tabbarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: 4,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                    ),
                    child: SegmentedTabControl(
                      radius: const Radius.circular(3),
                      backgroundColor: Colors.grey.shade300,
                      indicatorColor: Colors.orange.shade200,
                      tabTextColor: Colors.black45,
                      selectedTabTextColor: Colors.white,
                      squeezeIntensity: 2,
                      height: 45,
                      tabPadding: const EdgeInsets.symmetric(horizontal: 6),
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      tabs: [
                        SegmentTab(
                          label: 'Home',
                          color:kprimaryRed
                          //  Colors.red.shade200,
                        ),
                        // SegmentTab(
                        //   label: 'BMI',
                        //   color: Colors.red.shade200,
                        // ),
                        const SegmentTab(label: 'Diet'),
                        const SegmentTab(label: 'Yoga'),
                        SegmentTab(
                          label: 'SWatch',
                          backgroundColor: Colors.blue.shade100,
                          selectedTextColor: Colors.black45,
                          textColor: Colors.black26,
                        ),
                        SegmentTab(
                          label: 'Trainers',
                          backgroundColor: Colors.blue.shade100,
                          selectedTextColor: Colors.black45,
                          textColor: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      HomePage(),
                      // BmiScreen(),
                      DietPlanScreen(
                        
                      ),
                      YogaPlanScreen(
                        userBMI: 34.0,
                      ),
                      StopWatch(),
                      YogaTrainersScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 8,
        intensity: 0.7,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10))),
        child: Text(label),
      ),
    );
  }
}
