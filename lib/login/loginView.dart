import 'loginContract.dart';
import 'package:flutter/material.dart';
import 'package:bayker/shared/CurvedShape.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:animator/animator.dart';
import 'loginPresenter.dart';
import 'loginModel.dart';
import 'package:bayker/repository/AuthService.dart';

class LoginView extends StatelessWidget implements View {
  @override
  void showMessage() {
    /*Scaffold.of(BuildContext()).showSnackBar(new SnackBar(
      content: new Text("Sending Message"),
    ));*/
  }

  @override
  Widget build(BuildContext context) {
    var presenter = LoginPresenter();
    presenter.view = this;
    presenter.model = LoginModel();
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          /*Container(
            alignment: Alignment.center,
            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
            child: YoutubePlayer(
              context: context,
              videoId: "nxAMSxzDLME",
              autoPlay: true,
              hideControls: true,
              showVideoProgressIndicator: true,
              videoProgressIndicatorColor: Colors.amber,
              progressColors: ProgressColors(
                playedColor: Color(0xFFF09633),
                handleColor: Color(0xFFCD362C),
              ),
            ),
          ),*/
          Header(),
          Center(
            child: Column(
              children: <Widget>[
                UserProfile(),
                LoginButton(),
              ],
            ),
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
      child: Animator(
        builder: (Animation anim) => Opacity(
              opacity: anim.value,
              child: Container(
                height: 400.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "BYKER",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 60.0),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFCD362C), Color(0xFFF09633)])),
              ),
            ),
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

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialButton(
              onPressed: () => authService.signOut(),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Signout'),
            );
          } else {
            return MaterialButton(
              onPressed: () => authService.googleSignIn(),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Login with Google'),
            );
          }
        });
  }
}

class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();

    // Subscriptions are created here
    authService.profile.listen((state) => setState(() => _profile = state));

    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(padding: EdgeInsets.all(20), child: Text(_profile.toString())),
      Text(_loading.toString())
    ]);
  }
}
