import 'package:bayker/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bayker/login/user.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeView extends StatelessWidget {
  final String userName;
  final String email;

  // In the constructor, require a Todo
  HomeView({Key key, @required this.userName, @required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*SharedPreferences prefs = await SharedPreferences.getInstance();

      String counter = (prefs.getString('user') ?? "") ;
       User user = User.fromJson(counter);*/
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  userName[0],
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            MaterialButton(
                child: Icon(Icons.signal_cellular_off),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text(AppLocalizations.of(context)
                            .tr('dialog_sign_out_title')),
                        content: new Text(AppLocalizations.of(context)
                            .tr('dialog_sign_out_message')),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text(AppLocalizations.of(context)
                                .tr('dialog_sign_out_ok')),
                            onPressed: () {
                              authService.signOut();
                              Navigator.of(context).pop();
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
                    }))
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(userName),
      ),
    );
  }
}
