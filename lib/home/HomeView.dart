import 'package:bayker/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bayker/login/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'BottomNav.dart';

class HomeView extends StatefulWidget {
  final String userName;
  final String email;

  // In the constructor, require a Todo
  HomeView({Key key, @required this.userName, @required this.email})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeViewState(userName: userName, email: email);
  }
}

class HomeViewState extends State<HomeView> {
  final String userName;
  final String email;

  HomeViewState({Key key, @required this.userName, @required this.email});

  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      PlaceholderWidget(Colors.white),
      PlaceholderWidget(Colors.deepOrange),
      PlaceholderWidget(Colors.green),
      PlaceholderWidget(Colors.green)
    ];
    // TODO: implement build
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
                              //Navigator.of(context, rootNavigator: true).pop('dialog');
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
      body: _children[_cIndex],
      bottomNavigationBar: BottomNav(_incrementTab)
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.access_alarm, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text(''))
        ],
        onTap: (index) {
          _incrementTab(index);
        },
      ),*/
      /*body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(userName),
      ),*/
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
