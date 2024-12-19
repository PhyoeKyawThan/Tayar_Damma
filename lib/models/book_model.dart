import 'package:sqflite/sqflite.dart';

class BookModel {
  Future<Map<String, dynamic>> getBookById(Database db, id) async {
    List<Map<String, Object?>> book = 
    // await db.rawQuery("SELECT * FROM book");
    await db.rawQuery("SELECT * FROM book, recent_items WHERE book.id = ? AND book.id = recent_items.bookID LIMIT 1", [id]);
    return book[0];
  }

  Future<List<Map<String, dynamic>>> getBooks(Database db) async {
    return await db.rawQuery("SELECT * FROM book");
  }

  Future<int> deleteBook(Database db, String condition, int uniqueid) async {
    return await db.delete("book", where: condition, whereArgs: [uniqueid]);
  }

  Future<bool> addBook(Database db, Map<String, dynamic> book) async {
    if (await db.insert("book", book) != 0) {
      return true;
    }
    return false;
  }

  Future<Database> connect() async {
    Database db = await openDatabase("data.db");
    await db.execute("""CREATE TABLE IF NOT EXISTS book(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title VARCHAR(200),
      image VARCHAR(100),
      context TEXT,
      type INTEGER DEFAULT 0,
      pub_date DATETIME DEFAULT CURRENT_TIMESTAMP)""");
    // await db.execute("""CREATE TABLE IF NOT EXISTS recent_items(
    // id INTEGER PRIMARY KEY AUTOINCREMENT,
    // bookID INTEGER NOT NULL,
    // time DATETIME DEFAULT CURRENT_TIMESTAMP,
    // FOREIGN KEY(bookID) REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE
    // )""");
    return db;
  }

  Future<void> close(Database db) async {
    await db.close();
  }

  Future<void> sampleDataInsertion(Database db) async {
    List<String> arguments = [
      "('The Path to Enlightenment', 'path_to_enlightenment.jpg', 'A comprehensive guide to the teachings of Buddha.', 1, '2024-01-01 10:00:00')",
      "('Mindfulness for Beginners', 'mindfulness.jpg', 'An intEGERroduction to mindfulness and meditation techniques.', 1, '2024-01-05 12:30:00')",
      "('The Eightfold Path', 'eightfold_path.jpg', 'An in-depth analysis of the Noble Eightfold Path.', 2, '2024-01-10 14:00:00')",
      "('The Art of Compassion', 'compassion.jpg', 'Understanding and practicing compassion in everyday life.', 1, '2024-01-15 08:45:00')",
      "('Zen and the Art of Peace', 'zen_peace.jpg', 'A journey intEGERo Zen practices for achieving inner peace.', 3, '2024-01-20 16:20:00')",
      "('Meditation: A Beginners Guide', 'meditation_guide.jpg', 'Step-by-step guidance for newcomers to meditation.', 1, '2024-01-25 09:10:00')",
      "('The Dhammapada Explained', 'dhammapada.jpg', 'A commentary on the verses of the Dhammapada.', 2, '2024-01-30 11:00:00')",
      "('The Wisdom of Buddha', 'buddha_wisdom.jpg', 'Insights from the Buddha teachings for modern life.', 1, '2024-02-01 13:50:00')",
      "('Awakening the Mind', 'awakening.jpg', 'Techniques for awakening the mind through mindfulness.', 2, '2024-02-05 10:25:00')",
      "('Living a Noble Life', 'noble_life.jpg', 'Living ethically and with purpose according to the Buddha teachings.', 3, '2024-02-10 18:40:00')"
    ];
    for (String arg in arguments) {
      db.rawInsert(
          'INSERT INTO book( title, image, context, type, pub_date) VALUES $arg');
    }
  }
}
