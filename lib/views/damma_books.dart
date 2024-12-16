import 'package:damma/assets/item_box.dart';
import 'package:damma/datas/test_data.dart';
import 'package:flutter/material.dart';

class DammBook extends StatefulWidget {
  @override
  _DammaBookState createState() => _DammaBookState();
}

class _DammaBookState extends State<DammBook> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: book_items.length,
        itemBuilder: (context, index) {
          return ItemBox(book: book_items[index]);
        },
      ),
    );
  }
}
