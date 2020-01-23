import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNav extends StatefulWidget {
  final void Function(int) callback;
  BottomNav(this.callback);
  createState() => BottomNavState(callback);
}

class MenuItem {
  final String name;
  final Color color;
  final double x;
  MenuItem({this.name, this.color, this.x});
}

class BottomNavState extends State<BottomNav> {
  final void Function(int) callback;
  BottomNavState(this.callback);
  List items = [
    //MenuItem(x: -1.0, name: 'motorcycle2', color: Colors.white),
    MenuItem(x: 0.0, name: 'world', color: Colors.orange),
    MenuItem(x: 1.0, name: 'helmet', color: Colors.amber),
  ];

  MenuItem active;

  @override
  void initState() {
    super.initState();

    active = items[0]; // <-- 1. Activate a menu item
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      color: Colors.black87,
      child: Stack(
        //  <-- 2. Define a stack
        children: [
          AnimatedContainer(
            //  <-- 3. Animated top bar
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 8,
              width: w * 0.3,
              color: active.color,
            ),
          ),
          Container(
            // <-- 4. Main menu row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                return _flare(item); // <-- 5. Flare graphic will go here
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: FlareActor(
            'assets/${item.name}.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: item.name == active.name ? 'go' : 'idle',
          ),
        ),
      ),
      onTap: () {
        setState(() {
          active = item;
          callback(items.indexWhere((element) => element.x == item.x));
        });
      },
    );
  }
}
