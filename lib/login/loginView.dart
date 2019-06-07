import 'package:bayker/home/HomeView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginContract.dart';
import 'package:flutter/material.dart';
import 'package:bayker/shared/CurvedShape.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:animator/animator.dart';
import 'loginPresenter.dart';
import 'loginModel.dart';
import 'package:bayker/services/AuthService.dart';
import 'user.dart';

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
                  mainAxisAlignment: MainAxisAlignment.center,
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
              child: Icon(Icons.golf_course),
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

    _saveData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //int counter = (prefs.getInt('counter') ?? 0) + 1;
      //print('Pressed $counter times.');
      await prefs.setString('user', _profile.toString());
    }

    // Subscriptions are created here
    authService.profile.listen((state) => setState(() => {
          _saveData(),
          _profile = state,
          print("JSON: $_profile"),
          if (_profile.length > 0)
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeView(
                          userName: _profile['displayName'],
                          email: _profile['email'])))
            }
        }));

    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[Text(_loading.toString())]);
  }
}
