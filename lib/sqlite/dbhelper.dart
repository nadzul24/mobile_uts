import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../expired/expired.dart';
import '../item/item.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  get itemMapList => null;
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'buah.db';

    //create, read databases
    var itemDatabase = openDatabase(path,
        version: 7, onCreate: _createDb, onUpgrade: _onUpgrade);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //update tabel baru
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS item');
    batch.execute('DROP TABLE IF EXISTS expired');
    batch.execute('''
 CREATE TABLE item (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 kode TEXT,
 name TEXT,
 jenis TEXT,
 price INTEGER
 )
 ''');
    batch.execute('''
    CREATE TABLE expired (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tgl_exp TEXT,
    jml_busuk INTEGER,
    stock INTEGER
    )
    ''');
    await batch.commit();
  }

//select databases ITEM
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'name');
    return mapList;
  }

//select databases EXPIRED
  Future<List<Map<String, dynamic>>> selectExp() async {
    Database db = await this.initDb();
    var mapList = await db.query('expired', orderBy: 'tgl_exp');
    return mapList;
  }

//create databases ITEM
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

//create databases EXPIRED
  Future<int> insertExp(Expired object) async {
    Database db = await this.initDb();
    int count = await db.insert('expired', object.toMapExp());
    return count;
  }

//update databases ITEM
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//update databases EXPIRED
  Future<int> updateExp(Expired object) async {
    Database db = await this.initDb();
    int count = await db.update('expired', object.toMapExp(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //delete databases ITEM
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //delete databases EXPIRED
  Future<int> deleteExp(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('expired', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Item> itemList = List<Item>();
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  Future<List<Expired>> getExpList() async {
    var ExpMapList = await selectExp();
    int count = ExpMapList.length;
    List<Expired> ExpList = List<Expired>();
    for (int i = 0; i < count; i++) {
      ExpList.add(Expired.fromMapExp(ExpMapList[i]));
    }
    return ExpList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
