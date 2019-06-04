import 'loginContract.dart';
import 'package:flutter/material.dart';
import 'package:bayker/shared/CurvedShape.dart';

class LoginView extends StatelessWidget implements View {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Header(),
          Container(
            alignment: Alignment.topCenter,
            child: Text("BYKER", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedShape(),
      child: Container(
        height: 400.0,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFCD362C), Color(0xFFF09633)])),
      ),
    );
  }
}

class LoginBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/logo.png"), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
