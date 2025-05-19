import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static final String databaseName = "my_todo_app.sqlite";

  static Future<Database> databaseConnection() async {
    String databasePath = join(await getDatabasesPath(),databaseName);

    if (await databaseExists(databasePath)){
      print("Veritabanı zaten var.Kopyalamaya gerek yok.");
    }
    else{
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush: true);
      print("Veritabanı kopyalandı.");
    }

    return openDatabase(databasePath);
  }
}