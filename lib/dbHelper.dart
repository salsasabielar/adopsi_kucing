import 'package:adopsi_kucing/model/customer.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'model/item.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  //tipe data yang terpanggil dengan adanya delay
  // sistem akan terus menjalankan method tersebut sampai method itu selesai
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';
    //create, read databases
    var itemDatabase = openDatabase(path, version: 6, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama itemm
  void _createDb(Database db, int version) async {
    await db.execute(''
        'CREATE TABLE item (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,kode TEXT,jenisKelamin TEXT,ras TEXT)'
        '');
    await db.execute(''
        'CREATE TABLE customer (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,alamat TEXT, telp TEXT)'
        '');
  }

  //select databases item
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'kode');
    return mapList;
  }

  //select databases customer
  Future<List<Map<String, dynamic>>> selectCustomer() async {
    Database db = await this.initDb();
    var mapList = await db.query('customer', orderBy: 'name');
    return mapList;
  }

  //create databases item
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  //create databases customer
  Future<int> insertCustomer(Customer object) async {
    Database db = await this.initDb();
    int count = await db.insert('customer', object.toMap());
    return count;
  }

  //update databases item
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //update databases customer
  Future<int> updateCustomer(Customer object) async {
    Database db = await this.initDb();
    int count = await db.update('customer', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //delete databases item
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //delete databases customer
  Future<int> deleteCustomer(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('customer', where: 'id=?', whereArgs: [id]);
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
