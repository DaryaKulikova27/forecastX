import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static late Database _db;
  static bool _isInitialized = false;
  static const _tableName = 't_SettingsModel';
  static const _columnIsFirstLaunch = 'isFirstLaunch';

  Future init() async {
    if (!_isInitialized) {
      var databasePath = await getDatabasesPath();

      var path = join(databasePath, "db_v1.0.2.db");

      _db = await openDatabase(path, version: 1, onCreate: _createDB);
      _isInitialized = true;
    }
  }

  Future _createDB(Database db, int version) async {
    var dbInitScript = await rootBundle.loadString('assets/db_init.sql');

    dbInitScript.split(';').forEach((element) async {
      if (element.isNotEmpty) {
        await db.execute(element);
      }
    });

    await db.insert(
      't_SettingsModel',
      {'isFirstLaunch': 1},
    );
  }

  Future<bool> getIsFirstLaunch() async {
    final result = await _db.query(
      _tableName,
      columns: [_columnIsFirstLaunch],
      limit: 1,
    );

    if (result.isEmpty) {
      return true;
    }

    return result.first[_columnIsFirstLaunch] == 1;
  }

  Future<void> setIsFirstLaunch(bool value) async {
    await _db.update(
      _tableName,
      {_columnIsFirstLaunch: value ? 1 : 0},
    );
  }

  Future<void> clearIsFirstLaunch() async {
    await _db.update(
      _tableName,
      {_columnIsFirstLaunch: null},
    );
  }

  Future<void> close() async {
    await _db.close();
  }
}
