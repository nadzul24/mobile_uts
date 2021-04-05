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
        backgroundColor: Colors.yellow[600],
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 15,
                      bottom: 10,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.shopping_bag),
                      ),
                    ),
                  ),
                  Text(
                    'Welcome to the Istana Buah',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
