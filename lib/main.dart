
import 'package:bmi_calculator/Tabbar/tabbar.dart';
import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:bmi_calculator/auth_screens/login_screen.dart';
import 'package:bmi_calculator/exercise_videos/exercise_videos.dart';
import 'package:bmi_calculator/splashScreen.dart';
import 'package:bmi_calculator/stopwatch/stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'diseas_selection_screen/diseas_selection_screen.dart';
import 'firebase_options.dart';
import 'yoga_trainer/yoga_trainer2.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:kprimaryRed,
        //  primarySwatch: Colors.lightBlue,
        textSelectionTheme:
             TextSelectionThemeData(cursorColor: kprimaryOrange),
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline3:  TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: kprimaryOrange,
          ),
          
          caption: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: kprimaryOrange,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
            .copyWith(secondary: kprimaryRed),
      ),
      home:
      // ExerciseVideosScreen()
      SplashScreen()
      // YogaTrainersScreen()
      // Dashboard()
    );
  }
}
