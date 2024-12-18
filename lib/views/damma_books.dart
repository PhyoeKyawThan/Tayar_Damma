import 'package:damma/assets/item_box.dart';
import 'package:damma/models/book_model.dart';
// import 'package:damma/datas/test_data.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DammBook extends StatefulWidget {
  @override
  _DammaBookState createState() => _DammaBookState();
}

class _DammaBookState extends State<DammBook> {
  List<Map<String, dynamic>> _book_items = [];
  void fetchBooks() async {
    BookModel model = BookModel();
    Database db = await model.connect();
    List<Map<String, dynamic>> temp_books = await model.getBooks(db);
    setState(() {
      _book_items = temp_books;
    });
    model.close(db);
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: _book_items.length,
        itemBuilder: (context, index) {
          return ItemBox(book: _book_items[index]);
        },
      ),
    );
  }
}
