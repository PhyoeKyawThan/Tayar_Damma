import 'package:damma/assets/item_box.dart';
import 'package:damma/assets/data_objects.dart';
import 'package:damma/datas/test_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  bool is_new_user = true;
  bool _have_opened = true;

  final String dailyquote =
      "dailyquote might change or is dynamically determined,\n remove const from the widget:";
  @override
  Widget build(BuildContext context) {
    List<BookItem> recent_opened_items = recent_book_stack;
    // recent_opened_items.sort((f_book, s_book) => s_book.datetime!.compareTo(f_book.datetime!));
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          // space height for 20
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.brown[600],
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.brown[600], // Background color
                  borderRadius:
                      BorderRadius.circular(100), // Optional rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown[900]!.withOpacity(0.5),
                      blurRadius: 30,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipOval(
                  child:
                      Image.asset("images/buddha/image.png", fit: BoxFit.cover),
                )),
          ),
          // circle avatar or buddha image
          const SizedBox(
            height: 10,
          ),
          Text(
            '" ${dailyquote} "',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              // backgroundColor: Colors.red
            ),
            textAlign: TextAlign.center,
          ),
          const Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Recently Opened",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 102, 27, 21)),
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
          // recent opened title
          Container(
            child: _have_opened
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: recent_opened_items
                          .map((item) => ItemBox(book: item))
                          .toList(),
                    ),
                  )
                : const Text("~ There's no recently opened tab ~"),
          )
        ],
      ),
    );
  }
}
