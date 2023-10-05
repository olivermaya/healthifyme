import 'package:bmi_calculator/DietPlan/plainDetail.dart';
import 'package:bmi_calculator/Yoga_plans/yoga_detail.dart';
import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class YogaPlanScreen extends StatelessWidget {
  final double userBMI;

  YogaPlanScreen({required this.userBMI});

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
        'Here are some recommended yoga exercises to complement your diet plan:',
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
      )
      ,
      
                      SizedBox(height: 20.0),
                      _buildYogaExercises(context),
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
  Widget _buildYogaExercises(BuildContext context) {
    return Column(
      children: [
        _buildYogaCard(context, 'Mountain Pose', '5-10 min',
            'https://media.istockphoto.com/id/1451092199/photo/side-view-of-woman-in-mountain-pose-standing-on-pier-by-lake.jpg?b=1&s=170667a&w=0&k=20&c=FJfAakX-k_hGVDs0xAJKIVsOHbsEY9tVCxEvtJVPPVc='),
        _buildYogaCard(context, 'Downward-Facing Dog', '5-10 min',
            'https://media.istockphoto.com/id/628497814/photo/athlete-in-downward-facing-dog-position-on-shore.jpg?b=1&s=170667a&w=0&k=20&c=kinEvtUWzsqYbVi3QgAMj1ddRJoWRg0LNHvCHX7Et3k='),
        _buildYogaCard(context, 'Warrior Pose', '5-10 min',
            'https://media.istockphoto.com/id/1391377363/photo/man-performing-a-warrior-2-yoga-pose-on-a-pilates-reformer-bed.jpg?b=1&s=170667a&w=0&k=20&c=V7NsYUQMnwf6Swbg-GLvu6Dc1xlrrAvpPVqReFI6YrM='),
        _buildYogaCard(context, 'Tree Pose', '5-10 min',
            'https://media.istockphoto.com/id/1226740664/photo/tree-pose-athletic-slim-woman-with-hair-bun-in-tight-sportswear-practicing-yoga-doing.jpg?b=1&s=170667a&w=0&k=20&c=0bCTTqdTVOHzFECQDmDGIq7iLrAiP2r8YvY2DdtOuJg='),
      ],
    );
  }

_buildYogaCard(
  BuildContext context, String title, String time, String imagePath) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        depth: 8,
        intensity: 0.7,
        color: Colors.white,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(20),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  YogaDetailScreen(title: title, imagePath: imagePath),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    depth: 5,
                    intensity: 0.5,
                    color: Colors.white,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(16),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imagePath,
                      height: 120.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Recommended time: $time',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    InkWell(
  onTap: () {
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            YogaDetailScreen(title: title, imagePath: imagePath),
      ),
    );
  },
  child: Padding(
    padding: const EdgeInsets.only(right:8.0),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF65B8D8),
            Color(0xFF4389A2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_forward, color: Colors.white),
          SizedBox(width: 8.0),
          Text(
            'Detail',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  ),
),

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
