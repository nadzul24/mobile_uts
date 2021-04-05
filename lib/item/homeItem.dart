import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../drawerMenu.dart';
import 'item.dart';
import '../sqlite/dbhelper.dart';
import 'entryform.dart';

//pendukung program asinkron
class HomeItem extends StatefulWidget {
  static const itemPage = '/homeItem';
  @override
  HomeItemState createState() => HomeItemState();
}

class HomeItemState extends State<HomeItem> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item> itemList;
  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Item>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buah'),
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
              var item = await navigateToEntryForm(context, null);
              if (item != null) {
                //TODO 2 Panggil Fungsi untuk Insert ke DB
                int result = await dbHelper.insert(item);
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

  Future<Item> navigateToEntryForm(BuildContext context, Item item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
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
              child: Icon(Icons.grass),
            ),
            title: Text(
              this.itemList[index].name,
              style: textStyle,
            ),
            subtitle: Text(this.itemList[index].price.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item

                dbHelper.delete(this.itemList[index].id);
                updateListView();
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              if (item != null) {
                dbHelper.update(item);
                updateListView();
              }
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
