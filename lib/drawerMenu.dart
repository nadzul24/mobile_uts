import 'package:flutter/material.dart';
import 'package:tokobuahh/expired/homeExp.dart';
import 'homePage.dart';
import 'item/homeItem.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.yellow[600],
            child: Center(
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
                        child: Icon(Icons.agriculture),
                      ),
                    ),
                  ),
                  Text(
                    'Istana Buah',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'happy shoppping!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(Home.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text(
              'Item',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(HomeItem.itemPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text(
              'Expired',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(HomeExp.expPage);
            },
          ),
        ],
      ),
    );
  }
}
