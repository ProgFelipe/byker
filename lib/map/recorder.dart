import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Recorder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RecorderState();
  }
}

class RecorderState extends State<Recorder>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }

}