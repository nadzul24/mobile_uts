//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
import 'package:tokobuahh/expired/homeExp.dart';
import 'package:tokobuahh/item/homeItem.dart';
import 'homePage.dart';

//package letak folder Anda
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        // title: 'Tambah Buah',
        // theme: ThemeData(
        //   primarySwatch: Colors.blueGrey,
        // ),
        // home: Home(),
        routes: {
          // '/': (_) => Home(),
          Home.home: (_) => Home(),
          HomeItem.itemPage: (_) => HomeItem(),
          HomeExp.expPage: (_) => HomeExp(),
        });
  }
}
