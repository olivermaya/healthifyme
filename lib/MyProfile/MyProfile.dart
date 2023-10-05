import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "My Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 20),
              Neumorphic(
                style: NeumorphicStyle(
                  depth: 8,
                  color: Colors.white,
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.person,
                    size: 120,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _user?.email ?? "Unknown User",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 20),
              NeumorphicButton(
                onPressed: () {
                  _auth.sendPasswordResetEmail(email: _user?.email ?? "");
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: Neumorphic(
                          style: NeumorphicStyle(
                            depth: 5,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Password Reset Email Sent",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                NeumorphicButton(
                                  style: NeumorphicStyle(
                                    color: Colors.green,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    depth: 5,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.check, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: NeumorphicStyle(
                  color: kprimaryRed,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(12),
                  ),
                  depth: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
