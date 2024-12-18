import 'package:damma/assets/data_objects.dart';
import 'package:damma/datas/test_data.dart';
import 'package:damma/models/recent_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DammBookView extends StatelessWidget {
  final int RECENT_OPENED_ALLOWED_TAB = 3;
  // final int bookId;
  // final String title;
  final Map<String, dynamic> book;

  DammBookView({required this.book});

  Future<void> setRecentTrack() async {
    RecentModel recent = RecentModel();
    Database db = await recent.connect();
    await recent.addNewRecent(db, book);
    await recent.close(db);
  }

  @override
  Widget build(BuildContext context) {
    setRecentTrack();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book["title"],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, 'reload_widget');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  book["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                // title
                SizedBox(
                  height: 20,
                ),
                // space high
                Text(
                  book["context"],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                )
                // context
              ],
            )),
      ),
    );
  }
}
