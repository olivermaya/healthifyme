import 'package:bmi_calculator/DietPlan/plainDetail.dart';
import 'package:bmi_calculator/Yoga_plans/yoga_detail.dart';
import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DietPlanScreen extends StatefulWidget {
  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
double userBMI=25.0;
List<String>? selectedDiseases = [];

Future<void> setDisease() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // userBMI = prefs.getDouble('bmi');
  // print(userBMI!.toStringAsFixed(2));
   if(prefs.getStringList('selectedDiseases')==null){
    selectedDiseases=[
    'Obesity',
    'High blood pressure',
    'Diabetes',
    'Heart disease',
    'Arthritis',
    'Osteoporosis',
    'Back pain',
  ];
  }
  else{
    setState(() {
      selectedDiseases = prefs.getStringList('selectedDiseases');
    });
 
  }

  
}

Future<void> setBmi() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getDouble('bmi')==null){
    userBMI=25.0;
  }
  else{
    setState(() {
       userBMI = prefs.getDouble('bmi')!;
    });
 
  }
  print(userBMI.toStringAsFixed(2));
  // selectedDiseases = prefs.getStringList('selectedDiseases');
}


@override
void initState() {
  super.initState();
  setDisease().then((_) {
    print(selectedDiseases);
  });
  setBmi();
}
   @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildNeumorphicContainer(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        NeumorphicText(
        'Based on your BMI of' +userBMI.toStringAsFixed(2)+ ', here is your recommended daily caloric intake and meal plan:',
        style: NeumorphicStyle(
          depth: 8,
          color: Color.fromARGB(255, 114, 111, 111),
          shadowLightColor: Colors.white,
          shadowDarkColor: Colors.grey.shade400,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          intensity: 0.6,
        ),
        textStyle: NeumorphicTextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          // color: Color(0xFF3E3E3E),
        ),
      ),
                      SizedBox(height: 20.0),
                      _buildMealPlan(context),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildMealPlan(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('diet_plans').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(),);
      }

      List<Widget> mealCards = [];
      for (var document in snapshot.data!.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        double fromBmi = data['from_bmi'];
        double toBmi = data['to_bmi'];
        List<String> fitnessDiseases = List<String>.from(data['_selectedFitnessDiseases']);
        print(fitnessDiseases);
        print(selectedDiseases);
        if (userBMI >= fromBmi && userBMI <= toBmi
         && selectedDiseases!.any((disease) => fitnessDiseases.contains(disease))
        ) 
        {
          mealCards.add(_buildMealCard(
            context,
            data['title'],
            data['description'],
            data['kcal'],
            data['imageUrl'],
          ));
        }
      }

      if (mealCards.isEmpty) {
        return Text('No meal plans available for your BMI value and selected diseases');
      }

      return Column(children: mealCards);
    },
  );
}



  // Widget _buildMealPlan(context) {
  //   return Column(
  //     children: [
  //       _buildMealCard(
  //           context,'Breakfast', 'Oatmeal with berries and nuts', '300 kcal',"https://media.istockphoto.com/id/1402281575/photo/bowls-of-oatmeal-with-mixed-fruits-topping.jpg?b=1&s=170667a&w=0&k=20&c=TzW3OMMY5ynf6-CCcZX2ef7CbsCLyaLA79VDTi_j-D8="),
  //       _buildMealCard(context,'Snack', 'Apple with peanut butter', '100 kcal',"https://media.istockphoto.com/id/1307922194/photo/fresh-homemade-crunchy-peanut-butter-with-nuts-and-apples-on-light-wooden-background-in-the.jpg?b=1&s=170667a&w=0&k=20&c=To5k3dokYsqjvIMO95c8sTsy8a2NYZnFlNDeQ5u9UR0="),
  //       _buildMealCard(context,'Lunch',
  //         'Grilled chicken with sweet potato and vegetables', '400 kcal',"https://thumbs.dreamstime.com/z/roasted-chicken-breast-sweet-potatoes-salad-garnish-vegetables-53430484.jpg"),
  //       _buildMealCard(
  //           context,'Snack', 'Greek yogurt with honey and mixed berries', '150 kcal',"https://media.istockphoto.com/id/1303904130/photo/fresh-breakfast-with-greek-yogurt-nuts-oatmeal-granola-with-berries-in-a-bowl.jpg?b=1&s=170667a&w=0&k=20&c=k1Y0RuRpkhKRWRExj8m-Eu-gEAuw3DdL4Pn5pEhe2to="),
  //       _buildMealCard(
  //          context, 'Dinner', 'Salmon with brown rice and broccoli', '500 kcal',"https://cf-images.us-east-1.prod.boltdns.net/v1/static/507936866/1e6e95ec-b65d-4fc6-bf57-7b65d0b001f1/6ecae425-ccbb-4900-b5ce-1ed56d508cab/1280x720/match/image.jpg"),
  //     ],
  //   );
  // }

Widget _buildMealCard(context, String title, String description, String kcal, String imageUrl) {
  final screenWidth = MediaQuery.of(context).size.width;
  final cardWidth = screenWidth * 0.9;
  final imageHeight = cardWidth * 0.4;
  final contentHeight = cardWidth * 0.6;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: cardWidth * 0.05),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: cardWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: cardWidth * 0.04,
                      color: Colors.grey[700],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.fireplace, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            kcal,
                            style: TextStyle(
                              fontSize: cardWidth * 0.05,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                title: title,
                                description: description,
                                imageUrl: imageUrl,
                                calories: kcal,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Details',
                          style: TextStyle(
                            fontSize: cardWidth * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(
                              horizontal: cardWidth * 0.06,
                              vertical: cardWidth * 0.03,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildNeumorphicContainer({required Widget child}) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        depth: 5.0,
        intensity: 1.0,
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: child,
    );
  }
}
