import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';
class YogaTrainer {
  final String name;
  final String description;
  final double hourlyRate;
  final String phone;
  final String imageUrl;

  YogaTrainer({
    required this.name,
    required this.description,
    required this.hourlyRate,
    required this.phone,
    required this.imageUrl,
  });
}
class YogaTrainersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryRed,
        title: Text('Yoga Trainers'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('yoga_trainers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
  itemCount: data.size,
  itemBuilder: (BuildContext context, int index) {
    final doc = data.docs[index];
    final trainer = YogaTrainer(
      name: doc['name'],
      description: doc['description'],
      hourlyRate: doc['hourlyRate'],
      phone: doc['phone'],
      imageUrl: doc['imageUrl'],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              trainer.imageUrl,
              height: 128,
              width: 128,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainer.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "${trainer.hourlyRate} / hour",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    trainer.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildButton(
                        icon: Icons.phone,
                        onPressed: () => _launchPhone(trainer.phone),
                      ),
                      SizedBox(width: 2),
                      _buildButton(
                        icon: Icons.message,
                        onPressed: () => _launchSMS(trainer.phone),
                      ),
                       SizedBox(width: 2),
                      _buildButton(
                        icon: Icons.phone,
                        onPressed: () => _launchWhatsApp(trainer.phone),
                        color: Colors.green
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  },
);

        },
      ),
    );
  }

  Widget _buildButton({required IconData icon, required VoidCallback onPressed,color}) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
        depth: -3,
        intensity: 0.8,
        color: Colors.white,
      ),
      child: Icon(icon, color: color),
    );
  }

  void _launchPhone(String phone) async {
    final url = 
'tel:$phone';
if (await canLaunch(url)) {
await launch(url);
} else {
throw 'Could not launch $url';
}
}

void _launchSMS(String phone) async {
final url = 'sms:$phone';
if (await canLaunch(url)) {
await launch(url);
} else {
throw 'Could not launch $url';
}
}

void _launchWhatsApp(String phone) async {
final url = 'https://wa.me/$phone';
if (await canLaunch(url)) {
await launch(url);
} else {
throw 'Could not launch $url';
}
}
}