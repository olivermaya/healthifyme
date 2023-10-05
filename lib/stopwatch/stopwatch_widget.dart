import 'package:bmi_calculator/Utils/colorss.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class StopWatchh extends StatefulWidget {
  @override
  _MyStopwatchState createState() => _MyStopwatchState();
}

class _MyStopwatchState extends State<StopWatchh> {
  bool _isRunning = false;
  int _milliseconds = 0;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _milliseconds += 10;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _milliseconds = 0;
      _isRunning = false;
    });
  }

  String _formatMilliseconds(int milliseconds) {
    int minutes = (milliseconds / (60 * 1000)).truncate();
    int seconds = ((milliseconds / 1000) % 60).truncate();
    int hundredths = ((milliseconds / 10) % 100).truncate();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${hundredths.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1E5E8),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Neumorphic(
  style: NeumorphicStyle(
    depth: _isRunning ? 10 : 5,
    intensity: _isRunning ? 0.8 : 0.7,
    lightSource: LightSource.topLeft,
    color: Color(0xFFE1E5E8),
    boxShape: NeumorphicBoxShape.circle(),
  ),
  child: AnimatedContainer(
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
    height: _isRunning ? 220.0 : 190.0,
    width: _isRunning ? 220.0 : 190.0,
    child: Center(
      child: Text(
        _formatMilliseconds(_milliseconds),
        style: TextStyle(
          fontSize: _isRunning ? 40.0 : 32.0,
          fontWeight: FontWeight.bold,
          color: _isRunning ? Colors.white : Colors.black,
        ),
      ),
    ),
    
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: _isRunning
          ? LinearGradient(
              colors: [Color.fromARGB(255, 97, 94, 94),  Colors.blueGrey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : null,
      boxShadow: _isRunning
          ? [
              BoxShadow(
                color: Color.fromARGB(255, 112, 110, 106).withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ]
          : null,
    ),
  ),
)
, SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  NeumorphicFloatingActionButton(
                    onPressed: () {
                      if (_isRunning) {
                        _stopTimer();
                        setState(() {
                          _isRunning = false;
                        });
                      } else {
                        _startTimer();
                        setState(() {
                          _isRunning = true;
                        });
                      }
                    },
                    child: Icon(
                      _isRunning ? Icons.pause : Icons.play_arrow,
                      color:  Colors.blueGrey,
                    ),
                    style: NeumorphicStyle(
                      depth: 5,
                      intensity: 0.8,
                      lightSource: LightSource.topLeft,
                      color: Color(0xFFE1E5E8),
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                  ),
                  SizedBox(width: 20.0),
                SizedBox(width: 20.0),
               NeumorphicFloatingActionButton(
  onPressed: _resetTimer,
  child: Icon(Icons.refresh,color: Colors.white,),
  style: NeumorphicStyle(
    color: Colors.blueGrey,
    shape: NeumorphicShape.convex,
    boxShape: NeumorphicBoxShape.circle(),
  ),
),

              ],
            ),
          ],
        ),
      ),
    ));
  }
}

