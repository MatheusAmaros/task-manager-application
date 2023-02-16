import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''CREATE TABLE task (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT NOT NULL,
        description TEXT,
        date TEXT NOT NULL,
        timeBegin TEXT NOT NULL,
        timeEnd TEXT NOT NULL,
        timeEnd TEXT NOT NULL,
        done TEXT NOT NULL
      );
      
      ''');
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dataBase.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)

  static Future<int> createTask(String title, String? description, String date,
      String timeBegin, String timeEnd, String done) async {
    final db = await SQLHelper.db();
    //final ids = Uint8List.fromList(idsItems);
    final data = {
      'title': title,
      'description': description,
      'date': date,
      'timeBegin': timeBegin,
      'timeEnd': timeEnd,
      'done': done
    };
    final id = await db.insert('task', data,
        conflictAlgorithm: sql.ConflictAlgorithm.rollback);
    return id;
  }

  // Read all items (journals)

  static Future<int> updateTask(int id, String title, String? description,
      String date, String timeBegin, String timeEnd, String done) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
      'date': date,
      'timeBegin': timeBegin,
      'timeEnd': timeEnd,
      'done': done
    };

    final result =
        await db.update('taks', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<List<Map<String, dynamic>>> getTask() async {
    final db = await SQLHelper.db();
    return db.query('task', orderBy: "timeBegin");
  }

  static Future<List<Map<String, dynamic>>> getTaskByID(int id) async {
    final db = await SQLHelper.db();
    return db.query('task', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getTaskByDay(String date) async {
    final db = await SQLHelper.db();
    return db.query('task', where: "date = ?", whereArgs: [date]);
  }

  // Item

  static Future<void> deleteTask(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("task", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
