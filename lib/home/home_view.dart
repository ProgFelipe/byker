import 'package:bayker/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_nav.dart';
import 'package:bayker/map/road_map.dart';
import 'package:bayker/feeds/feeds.dart';
import 'package:bayker/crew/crew.dart';
import 'package:bayker/login/login_view.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var userName = "Guest";
  var _appBarTitle = "Bayker";
  var _isLoggedUser = false;
  var email = "";
  int _cIndex = 1;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  Map<String, dynamic> _profile;

  void _requestPermissions() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions(
            [PermissionGroup.location, PermissionGroup.locationAlways]);
    print(permissions);
    PermissionStatus _permissionStatus = permissions[PermissionGroup.location];
    print(_permissionStatus);
  }

  @override
  initState() {
    super.initState();
    //_requestPermissions();
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

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      RoadMap(
        key: PageStorageKey('Page1'),
      ),
      Feeds(
        key: PageStorageKey('Page2'),
      ),
      Crew(
        key: PageStorageKey('Page3'),
      )
    ];

    return Scaffold(
        appBar: AppBar(
            title: Text(
              _appBarTitle,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black54),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black54),
                accountName: Text(userName),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.black54
                          : Colors.white,
                  child: Text(
                    userName[0],
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              LoginButton(
                isLoggedUser: _isLoggedUser,
              ),
              MaterialButton(
                onPressed: () => _requestPermissions(),
                child: Text("Request Permission"),
              )
            ],
          ),
        ),
        body: PageStorage(
          child: _pages[_cIndex],
          bucket: bucket,
        ),
        bottomNavigationBar: BottomNav(_incrementTab));
  }
}
