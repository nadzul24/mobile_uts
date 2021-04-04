import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokobuahh/drawerMenu.dart';

class Home extends StatelessWidget {
  static const home = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hai!',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
