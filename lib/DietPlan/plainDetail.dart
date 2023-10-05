import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
class DetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String calories;

  const DetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.calories,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScreenshotController screenshotController = ScreenshotController();

  void takeScreenshot() async {
    final image = await screenshotController.capture();
    // Do something with the captured image
    print('Captured screenshot');
  }

  void saveImage() async {
    final image = await screenshotController.capture();
    final result = await ImageGallerySaver.saveImage(image!);
    print('Saved screenshot to gallery: $result');
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Screenshot(
            controller: screenshotController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Back Button
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: -3,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: NeumorphicIcon(
                            style:NeumorphicStyle(color: kprimaryRed),
                            Icons.arrow_back_ios_rounded,
                            size: screenWidth * 0.08,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                // Image and Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: 2,
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            height: screenWidth * 0.7,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          NeumorphicIcon(
                            style:NeumorphicStyle(color: Colors.red),
                            Icons.local_fire_department_rounded,
                            size: screenWidth * 0.04,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${widget.calories} calories',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          
                // Description
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
          
                // Action Buttons
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: -3,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: NeumorphicIcon(
                            style:NeumorphicStyle(color: kprimaryRed),
                            Icons.favorite_rounded,
                            size: screenWidth * 0.08,
                          ),
                        ),
                      ),
                      // Neumorphic(
                      //   style: NeumorphicStyle(
                      //     depth: -3,
                      //     boxShape: NeumorphicBoxShape.circle(),
                      //   ),
                      //   child: IconButton(
                      //     onPressed: () {},
                      //     icon: NeumorphicIcon(
                           
          
                    // child: 
                  //   IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.save_outlined,
                  //       size: screenWidth * 0.08,
                  //     ),
                  //   ),
                  // ),
                  // NeumorphicButton(
                  //   onPressed: () {},
                  //   style: NeumorphicStyle(
                  //     depth: -3,
                  //     boxShape: NeumorphicBoxShape.roundRect(
                  //       BorderRadius.circular(20),
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 12.0,
                  //       vertical: 8.0,
                  //     ),
                  //     child: Text(
                  //       'Screen Shot',
                  //       style: TextStyle(
                  //         fontSize: screenWidth * 0.04,
                  //         fontWeight: FontWeight.bold,
                  //         color: NeumorphicTheme.isUsingDark(context)
                  //             ? Colors.white
                  //             : Colors.black87,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
           Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    NeumorphicButton(
      onPressed: takeScreenshot,
      style: NeumorphicStyle(
        color: Colors.grey[200],
        depth: 4,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Text('Take Screenshot'),
    ),
    SizedBox(width: 16),
    NeumorphicButton(
      onPressed: saveImage,
      style: NeumorphicStyle(
        color: Colors.grey[200],
        depth: 4,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Text('Save to Gallery'),
    ),
  ],
),]
                  ),
          ),
      
    ),
  ),
);
}
}