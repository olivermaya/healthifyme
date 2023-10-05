import 'package:bmi_calculator/Bmi_Screen.dart';
import 'package:bmi_calculator/DietPlan/DietPlan.dart';
import 'package:bmi_calculator/Home/logout_alert.dart';
import 'package:bmi_calculator/MyProfile/MyProfile.dart';
import 'package:bmi_calculator/Yoga_plans/yoga_plans.dart';
import 'package:bmi_calculator/exercise_videos/exercise_videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top section
                Container(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: 48,
                          ),
                          SizedBox(width: 8),
                          NeumorphicText(
                            'Yoga Exercise App',
                            style: NeumorphicStyle(
                              depth: 5,
                              color: Color.fromARGB(255, 161, 159, 159),
                            ),
                            textStyle: NeumorphicTextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      NeumorphicText(
                        'Welcome back',
                        style: NeumorphicStyle(
                          depth: 3,
                          color: Colors.grey[400],
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                // Menu section
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Menu items
                          buildMenuItem(
                              context, 'My Profile', Icons.person_outline, () {
                                Get.to(MyProfilePage());
                              }),
                          SizedBox(height: 16),
                          buildMenuItem(context, 'Yoga Plans', Icons.fitness_center,
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YogaPlanScreen(userBMI: 45),
                              ),
                            );
                          }),
                          SizedBox(height: 16),
                          buildMenuItem(context, 'Exercise Videos', Icons.video_collection,
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExerciseVideosScreen(),
                              ),
                            );
                          }),
                          SizedBox(height: 16),
                          buildMenuItem(
                              context, 'Diet Plans', Icons.local_dining, () {
                                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DietPlanScreen(),
                              ),
                            );
                                
                              }),
                          SizedBox(height: 16),
                          buildMenuItem(
                              context, 'BMI Calculator', Icons.calculate, () {
                                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BmiScreen(),
                              ),
                            );
                              }),
                                SizedBox(height: 16),
                          buildMenuItem(
                              context, 'Log Out', Icons.logout_sharp, () {
                              Get.to(LogoutAlertBox());
                              }),
                        
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      BuildContext context, String title, IconData icon, VoidCallback ontap) {
    return NeumorphicButton(
      onPressed: () {
        ontap();
      },
      style: NeumorphicStyle(
        depth: 3,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
