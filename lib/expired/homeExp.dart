import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tokobuahh/expired/expired.dart';
import 'package:tokobuahh/sqlite/dbhelper.dart';

import '../drawerMenu.dart';
import 'entryExp.dart';

//pendukung program asinkron
class HomeExp extends StatefulWidget {
  static const expPage = '/homeExp';
  @override
  HomeExpState createState() => HomeExpState();
}

class HomeExpState extends State<HomeExp> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Expired> expList;
  @override
  Widget build(BuildContext context) {
    if (expList == null) {
      expList = List<Expired>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Tanggal Expired'),
        backgroundColor: Colors.yellow[600],
      ),
      drawer: DrawerMenu(),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            backgroundColor: Colors.yellow[600],
            child: Icon(Icons.add),
            onPressed: () async {
              var expired = await navigateToEntryForm(context, null);
              if (expired != null) {
                //TODO 2 Panggil Fungsi untuk Insert ke DB
                int result = await dbHelper.insertExp(expired);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          ),
        ),
      ]),
    );
  }

  Future<Expired> navigateToEntryForm(
      BuildContext context, Expired expired) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryExp(expired);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.today),
            ),
            title: Text(
              this.expList[index].kodebuah,
              style: textStyle,
            ),
            subtitle: Text('Exp: ' + this.expList[index].tglExp),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan tgl exp

                dbHelper.delete(this.expList[index].id);
                updateListView();
              },
            ),
            onTap: () async {
              var expired =
                  await navigateToEntryForm(context, this.expList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              if (expired != null) {
                dbHelper.updateExp(expired);
                updateListView();
              }
            },
          ),
        );
      },
    );
  }

  //update List exp
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Expired>> expListFuture = dbHelper.getExpList();
      expListFuture.then((expList) {
        setState(() {
          this.expList = expList;
          this.count = expList.length;
        });
      });
    });
  }
}
