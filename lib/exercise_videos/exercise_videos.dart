import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:bmi_calculator/exercise_videos/play_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class ExerciseVideosScreen extends StatefulWidget {
  @override
  _ExerciseVideosScreenState createState() => _ExerciseVideosScreenState();
}

class _ExerciseVideosScreenState extends State<ExerciseVideosScreen> {

  final List<String> videos = [    'Vr3h5X9kmUo',     'hJbRpHZr_d0',        'sTANio_2E0Q',     ];

  @override
  void initState() {
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Trainers Videos',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color:kprimaryRed
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  itemCount: videos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(VideoPlayerScreen(videoId: videos[index]));
                      },
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.network(
                            'https://img.youtube.com/vi/${videos[index]}/mqdefault.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            color: Colors.black.withOpacity(0.7),
                            child: Text(
                              'Trainer Video ${index + 1}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
