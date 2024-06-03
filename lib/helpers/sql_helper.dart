import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SqlHelper {
  Database? db;
  // SqlHelper() {
  //   initDatabase();
  // }

  //Create database tables
  Future<bool?> createTables() async {
    try {
      var batch = db!.batch();

      batch.execute("""Create table if not exists category(
        id integer primary key,
        name text,
        description text
      )""");
      var result = await batch.commit();
      if(result != null){
        print("Table created successfully: $result");
      return true;
      }
      else{
        return null;
      }
      
    } catch (e) {
      print("Error in creating Category tabe: ${e}");
    }
  }

  Future<List<Map<String, dynamic>>?> getmployes() async {
    var result = await db?.query('category');
    return result;
  }

  // Create database on the web or phone.
  Future<void> initDatabase() async {
    try {
      if (kIsWeb) {
        // Use the ffi web factory in web apps (flutter or dart)
        var factory = databaseFactoryFfiWeb;
        db = await factory.openDatabase('task13.db');
        // var sqliteVersion =
        //     (await db.rawQuery('select sqlite_version()')).first.values.first;
        print(db.hashCode);
        // print(sqliteVersion); // should print 3.39.3
      } else {
        db = await openDatabase('task13.db', version: 1,
            onCreate: (db, version) {
          print("=============================== Db Created");
        });
      }
    } catch (e) {
      print("Error in Creating the database : ${e}");
    }
  }
}
