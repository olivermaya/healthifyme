
import 'package:flutter/material.dart';

class YogaDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;

  YogaDetailScreen({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imagePath,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            Text(
              title,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Description goes here...',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
