import 'package:bmi_calculator/Tabbar/tabbar.dart';
import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FitnessDiseaseScreen extends StatefulWidget {
  const FitnessDiseaseScreen({Key? key}) : super(key: key);

  @override
  _FitnessDiseaseScreenState createState() => _FitnessDiseaseScreenState();
}

class _FitnessDiseaseScreenState extends State<FitnessDiseaseScreen> {
  List<String> selectedDiseases = [];

  final List<String> fitnessDiseases = [
    'Obesity',
    'High blood pressure',
    'Diabetes',
    'Heart disease',
    'Arthritis',
    'Osteoporosis',
    'Back pain',
  ];

  final Map<String, IconData> diseaseIcons = {
    'Obesity': Icons.accessibility_new,
    'High blood pressure': Icons.favorite_border,
    'Diabetes': Icons.grain,
    'Heart disease': Icons.favorite,
    'Arthritis': Icons.directions_run,
    'Osteoporosis': Icons.warning,
    'Back pain': Icons.mood_bad,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        title: Text(
          'Select Your Fitness Diseases',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              'What kind of fitness disease do you have?',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: ListView.builder(
                itemCount: fitnessDiseases.length,
                itemBuilder: (BuildContext context, int index) {
                  final disease = fitnessDiseases[index];
                  final icon = diseaseIcons[disease];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        color: Colors.grey[200]!,
                        depth: 5.0,
                        lightSource: LightSource.topLeft,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12.0),
                        ),
                      ),
                      child: CheckboxListTile(
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              selectedDiseases.add(disease);
                            } else {
                              selectedDiseases.remove(disease);
                            }
                          });
                        },
                        value: selectedDiseases.contains(disease),
                        checkColor: Colors.white,
                        activeColor: Colors.blue,
                        title: Row(
                          children: [
                            Icon(icon),
                            SizedBox(width: 16.0),
                            Text(
                              disease,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          
            SizedBox(height: 24.0),
            Center(
              child: Container(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.arrow_forward),
                  label: Text(
                    'Next',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kprimaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: ()async {
                    if (selectedDiseases.isNotEmpty) {
    // Store the selected diseases in shared preferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('selectedDiseases', selectedDiseases);

    // Navigate to the next screen
    Get.to(Tabbarr());
  }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('select disease')),
      );
  
  }
                    // if (selectedDiseases.isNotEmpty) {
                    //   // Do something with the selected diseases
                    //   print('Selected fitness diseases: $selectedDiseases');
                    //   Get.to(Tabbarr());
                    // }
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0
),
          ],
        ),
      ),
    );
  }
}
