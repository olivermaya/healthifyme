import 'package:bmi_calculator/Home/Home.dart';
import 'package:bmi_calculator/Tabbar/tabbar.dart';
import 'package:bmi_calculator/auth_screens/custom_route.dart';
import 'package:bmi_calculator/auth_screens/users.dart';
import 'package:bmi_calculator/diseas_selection_screen/diseas_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(LoginData data) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: data.name,
      password: data.password,
    );
    return null;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'User not exists';
    } else if (e.code == 'wrong-password') {
      return 'Password does not match';
    }
    return 'Unknown error occurred';
  }
}


 Future<String?> _signupUser(SignupData data) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: data.name!,
      password: data.password!,
    ).whenComplete(() => 
    
     Get.offAll(FitnessDiseaseScreen())
    
    );
  

    return null;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      return 'Email already exists';
    }
    return 'Unknown error occurred';
  }
}


  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  Future<String?>? _signupConfirm(String error, LoginData data) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: FlutterLogin(
        logo: const AssetImage('assets/images/logo.png'),
        navigateBackAfterRecovery: true,
        onConfirmRecover: _signupConfirm,
        onConfirmSignup: _signupConfirm,
        loginAfterSignUp: false,
      //   additionalSignupFields: [
      //   const UserFormField(
      //     keyName: 'Username',
      //     icon: Icon(FontAwesomeIcons.userLarge),
      //   ),
      //   const UserFormField(keyName: 'Name'),
      //   const UserFormField(keyName: 'Surname'),
      //   UserFormField(
      //     keyName: 'phone_number',
      //     displayName: 'Phone Number',
      //     userType: LoginUserType.phone,
      //     fieldValidator: (value) {
      //       final phoneRegExp = RegExp(
      //         '^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$',
      //       );
      //       if (value != null &&
      //           value.length < 7 &&
      //           !phoneRegExp.hasMatch(value)) {
      //         return "This isn't a valid phone number";
      //       }
      //       return null;
      //     },
      //   ),
      // ],
      
        termsOfService: [
          // TermOfService(
          //   id: 'newsletter',
          //   mandatory: false,
          //   text: 'Newsletter subscription',
          // ),
          TermOfService(
            id: 'general-term',
            mandatory: true,
            text: 'Term of services',
            linkUrl: 'https://github.com/NearHuscarl/flutter_login',
          ),
        ],
        userValidator: (value) {
          if (!value!.contains('@') || !value.endsWith('.com')) {
            return "Email must contain '@' and end with '.com'";
          }
          return null;
        },
        passwordValidator: (value) {
          if (value!.isEmpty) {
            return 'Password is empty';
          }
          return null;
        },
       onLogin: (loginData) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginData.name,
      password: loginData.password,
    );
    return Navigator.of(context).pushReplacement(
      FadePageRoute(
        builder: (context) => Tabbarr(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'User not exists';
    } else if (e.code == 'wrong-password') {
      return 'Password does not match';
    }
    return 'Unknown error occurred';
  }
},
onSignup: (signupData) async {
  try {
    debugPrint('Signup info');
        debugPrint('Name: ${signupData.name}');
        debugPrint('Password: ${signupData.password}');

        // signupData.additionalSignupData?.forEach((key, value) {
        //   debugPrint('$key: $value');
        // });
        if (signupData.termsOfService.isNotEmpty) {
          debugPrint('Terms of service: ');
          for (final element in signupData.termsOfService) {
            debugPrint(
              ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}',
            );
          }
        }
        return _signupUser(signupData);
      
    // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: signupData.name!,
    //   password: signupData.password!,
    // ).whenComplete(() async{
    //     await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.email).set({
    //     'email': signupData.name,
    //     'name': signupData.name,
    //   });
    // });
    // return Navigator.of(context).pushReplacement(
    //   FadePageRoute(
    //     builder: (context) => Tabbarr(),
    //   ),
    // );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      return 'Email already exists';
    }
    return 'Unknown error occurred';
  }
},
 onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(
            FadePageRoute(
              builder: (context) => FitnessDiseaseScreen(),
            ),
          );
        },
        onRecoverPassword: (name) {
          debugPrint('Recover password info');
          debugPrint('Name: $name');
          return _recoverPassword(name);
        },
        headerWidget: const IntroWidget(),
      ),
    );
  }
}

class IntroWidget extends StatelessWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Yoga Exercise App",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
