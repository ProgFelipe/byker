import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Recorder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecorderState();
  }
}

class RecorderState extends State<Recorder> {
  Stopwatch stopWatch;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (stopWatch == null) {
      stopWatch = Stopwatch();
    }
    if (!stopWatch.isRunning) {
      stopWatch.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Center(
              child: TimerText(
                stopwatch: stopWatch,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 00.0, 30.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: () => stopWatch.start(),
                    backgroundColor: Colors.green,
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 30.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  child: Icon(Icons.stop),
                  onPressed: () => stopWatch.stop(),
                ),
              ),
            ),
          ],
        ));
  }
}

class TimerTextFormatter {
  static String format(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}

class TimerText extends StatefulWidget {
  TimerText({this.stopwatch});
  final Stopwatch stopwatch;

  TimerTextState createState() => new TimerTextState(stopwatch: stopwatch);
}

class TimerTextState extends State<TimerText> {
  Timer timer;
  final Stopwatch stopwatch;

  TimerTextState({this.stopwatch}) {
    timer = Timer.periodic(new Duration(seconds: 1), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle timerTextStyle =
        const TextStyle(fontSize: 60.0, fontFamily: "Open Sans");
    String formattedTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
    return new Text(formattedTime, style: timerTextStyle);
  }
}
