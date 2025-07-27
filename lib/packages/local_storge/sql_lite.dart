// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class SqlLiteDB {
  SqlLiteDB._();

  static final instance = SqlLiteDB._();

  final String _databaseName = "test_app.db";
  final int _version = 1;
  Database? _db;

  Future<Database> get database async {
    if (_db == null) {
      _db = await _initialDatabase();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future<Database> _initialDatabase() async {
    // final String defaultPathWithoutDbName = await getDatabasesPath();

    String fullPath = join("/storage/emulated/0/Download/", _databaseName);

    Database mydb = await openDatabase(
      fullPath,
      onCreate: _onCreate,
      version: _version,
    );

    return mydb;
  }

  Future<void> _onCreate(Database mydb, int version) async {
    mydb.execute('''
        CREATE TABLE Students (
            name Varchar(100),
            age  NUMERIC
        )
        ''');
  }

  Future<void> insert(String tableName, List<Map<String, Object?>> data) async {
    final db = await database;

    final Batch batch = db.batch();

    for (var element in data) {
      batch.insert(tableName, element);
    }

    await batch.commit();
  }

  Future<int> update(String tableName, String values, String where) async {
    final db = await database;
    // "Update Students set id=5,name='Ahmad' where id=2 and name ='Moh'"

    int result = await db.rawUpdate("Update $tableName set $values $where");

    // int result2 = await db.update(
    //   tableName,
    //   {"id": 5, "name": "Ahmad"},
    //   where: "id=?,name=?",
    //   whereArgs: [1, "Mohammad"],
    // );

    return result;
  }

  Future<int> delete(String tableName, String where) async {
    final db = await database;

    // Delete from Students where id=5

    int result = await db.rawDelete("Delete from $tableName $where");

    // int result2 = await db.delete(tableName, where: "id=?",whereArgs: [1]);

    return result;
  }

  Future<List<Map<String, Object?>>> getAll(String tableName) async {
    final db = await database;

    List<Map<String, Object?>> result = await db.rawQuery(
      "Select * from $tableName",
    );

    log(result.toString());

    return result;
  }

  Future<List<Map<String, Object?>>> getStudents() async {
    final db = await database;

    List<Map<String, Object?>> result = await db.rawQuery(
      "Select * from Students",
    );

    return result;
  }
}
