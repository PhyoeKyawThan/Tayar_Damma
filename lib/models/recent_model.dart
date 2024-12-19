import 'package:sqflite/sqflite.dart';

class RecentModel {
  Future<List<Map<String, dynamic>>> getRecentBooks(Database db) async {
    return await db.rawQuery("SELECT * FROM recent_items ORDER BY time DESC");
  }

  Future<int> deleteRecent(Database db, int uniqueid) async {
    return await db
        .rawDelete("DELETE FROM recent_items WHERE id = ?", [uniqueid]);
  }

  Future<bool> addNewRecent(Database db, Map<String, dynamic> book) async {
    List<Map> recentIds = await db.rawQuery("SELECT id FROM recent_items");
    List<Map> exist_recent = await db
        .rawQuery("SELECT * FROM recent_items WHERE bookID = ?", [book["id"]]);
    if (exist_recent.isNotEmpty) {
      // await deleteRecent(db, " bookID = ?", book["id"]);
      await updateRecent(db, book["id"] as int);
      // await db.insert("recent_items", {"bookID": book["id"]});
      return true;
    }
    if (recentIds.length == 3) {
      await deleteRecent(db, recentIds[recentIds.length - 1]["id"]);
      await db.insert("recent_items", {
        "bookID": book["id"],
      });
      return true;
    }
    if (await db.insert("recent_items", {
          "bookID": book["id"],
        }) !=
        0) {
      return true;
    }
    return false;
  }

  Future<void> updateRecent(Database db, int recentId) async {
    await db.rawUpdate("UPDATE recent_items SET time = ? WHERE id = ? ",
        [DateTime.now().toString(), recentId]);
  }

  Future<Database> connect() async {
    Database db = await openDatabase("data.db");
    // await db.execute("""CREATE TABLE IF NOT EXISTS book(
    //   id INTEGER PRIMARY KEY AUTOINCREMENT,
    //   title VARCHAR(200),
    //   image VARCHAR(100),
    //   context TEXT,
    //   type INTEGER DEFAULT 0,
    //   pub_date DATETIME DEFAULT CURRENT_TIMESTAMP)""");
    await db.execute("""CREATE TABLE IF NOT EXISTS recent_items(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    bookID INTEGER NOT NULL,
    time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(bookID) REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE
    )""");
    return db;
  }

  Future<void> close(Database db) async {
    await db.close();
  }
}
