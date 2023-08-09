// import 'dart:html';
import 'dart:developer';
import 'dart:io';


// import '../models/item_cart.dart';


import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data/product_model.dart';



// import 'models/user.dart';

class DataBase{
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path =
    join(directory.path, 'prduct.db'); //create path to database create
    // join(directory.path, 'prduct.db'); //create path to database create

    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          """CREATE TABLE product(id INTEGER  PRIMARY KEY ASC AUTOINCREMENT,category INTEGER,name TEXT,providerName TEXT,img TEXT,price TEXT)""");
      await db.execute(  """ CREATE TABLE  images(id INTEGER  PRIMARY KEY ASC AUTOINCREMENT,p_id INTEGER, img TEXT)""");
   // var p=Product(id: 1,name: "هذا النص هو مثال لنص",img: "assets/image/img_4.png",price: 120.0,providerName: "اسم المتجر");
   //    var p2=  Product(id: 2,name: "هذا النص هو مثال لنص",img: "assets/image/img_5.png",price: 120.0,providerName: "اسم المتجر");
   //    var p3= Product(id: 3,name: "هذا النص هو مثال لنص",img: "assets/image/img_6.png",price: 120.0,providerName: "اسم المتجر");
   //    var p4=  Product(id: 4,name: "هذا النص هو مثال لنص",img: "assets/image/img_7.png",price: 120.0,providerName: "اسم المتجر");
   //    await db.insert("product", p.toJson());
   //    await db.insert("product", p2.toJson());
   //    await db.insert("product", p3.toJson());
   //    await db.insert("product", p4.toJson());
      await db.close();
    }
    ,onUpgrade: (db,oldVersion,newVersion) async {
      log("Upgrading database from version " + oldVersion.toString() + " to " + newVersion.toString());
      // await db.execute(
      //   'ALTER TABLE ordere ADD COLUMN withcook TEXT DEFAULT 0, ADD COLUMN column2 INTEGER',
      // );
        });
  }

  Future<int> saveProduct(Product item) async {
    var dbClient  = await init();
    // prints("${item.toJson()}");
    int res = await dbClient.insert("product", item.toJson());
    // print('done my location (Clothes id: $res)');
    return res;
  }
  Future<int> updateProduct(Product item) async {
    var dbClient  = await init();
    // prints("${item.toJson()}");
    int res = await dbClient.update("product", item.toJson(),where: "id= ? ",whereArgs: [item.id]);
    // print('done my location (Clothes id: $res)');
    return res;
  }

  Future<List<Product>> getAllProducts() async {
    Database db =  await init();
    List<Map<String,dynamic>> todoMapList;

    todoMapList = await db.query('product');
    // prints("ppp ${todoMapList}");
    int count = todoMapList.length;         // Count the number of map entries in db table

    List<Product> todoList = [];
    // For loop to create a 'todo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      todoList.add(Product.fromJson(todoMapList[i]));
    }
    // print('hereeeeeeeeeeee ${todoList.toString()}');
    return todoList;
  }


}