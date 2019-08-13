import 'package:bayker/home/home_view.dart';
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
import 'package:easy_localization/easy_localization.dart';

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
  bool isLoggedUser;
  LoginButton({this.isLoggedUser});
  @override
  Widget build(BuildContext context) {
    if (isLoggedUser) {
      return MaterialButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text(
                    AppLocalizations.of(context).tr('dialog_sign_out_title')),
                content: new Text(
                    AppLocalizations.of(context).tr('dialog_sign_out_message')),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text(
                        AppLocalizations.of(context).tr('dialog_sign_out_ok')),
                    onPressed: () {
                      //Navigator.of(context, rootNavigator: true).pop('dialog');
                      authService.signOut();
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text(AppLocalizations.of(context)
                        .tr('dialog_sign_out_cancel')),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }),
        color: Colors.red,
        textColor: Colors.white,
        child: Text('SignOut'),
      );
    } else {
      return MaterialButton(
        onPressed: () => authService.googleSignIn(),
        color: Colors.white,
        textColor: Colors.black,
        child: Text('SignIn'),
      );
    }
  }
}
