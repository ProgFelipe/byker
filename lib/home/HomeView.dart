import 'package:bayker/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bayker/login/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'BottomNav.dart';
import 'package:bayker/map/google_map.dart';
import 'package:bayker/feeds/feeds.dart';
import 'package:bayker/crew/crew.dart';
import 'package:bayker/login/login_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var userName = "Guest";
  var _appBarTitle = "Guest";
  var _isLoggedUser = false;
  var email = "";
  int _cIndex = 0;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  Map<String, dynamic> _profile;

  @override
  initState() {
    super.initState();

    _saveData(Map<String, dynamic> _profile) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //int counter = (prefs.getInt('counter') ?? 0) + 1;
      //print('Pressed $counter times.');
      await prefs.setString('user', _profile.toString());
    }

    // Subscriptions are created here
    authService.profile.listen((state) => setState(() => {
          _saveData(_profile),
          _profile = state,
          print("JSON: $_profile"),
          if (_profile.length > 0)
            {
              _isLoggedUser = true,
              userName = _profile['displayName'],
              _appBarTitle = userName,
              email = _profile['email']
            }
        }));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      GoogleMap(),
      Feeds(),
      Crew(),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
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
              LoginButton(isLoggedUser: _isLoggedUser,),
            ],
          ),
        ),
        body: _children[_cIndex],
        bottomNavigationBar: BottomNav(_incrementTab));
  }
}
