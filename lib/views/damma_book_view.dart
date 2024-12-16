import 'package:damma/assets/data_objects.dart';
import 'package:damma/datas/test_data.dart';
import 'package:flutter/material.dart';

class DammBookView extends StatelessWidget {
  final int RECENT_OPENED_ALLOWED_TAB = 3;
  // final int bookId;
  // final String title;
  final BookItem book;

  DammBookView({required this.book}) {
    book.datetime = DateTime.now();
    bool is_duplicate = false;
    if (recent_book_stack.length > 0) {
      int duplicate_index = recent_book_stack
          .indexWhere((opened_book) => opened_book.bookId == book.bookId);
      // print(duplicate_index);
      if (duplicate_index != -1) {
        recent_book_stack[0] = book;
        is_duplicate = true;
      }
    }

    if (!is_duplicate) {
      if (recent_book_stack.length == RECENT_OPENED_ALLOWED_TAB) {
        recent_book_stack[0] = book;
      } else {
        recent_book_stack.add(book);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  book.title,
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
                  book.context,
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
