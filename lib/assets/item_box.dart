import 'package:damma/assets/data_objects.dart';
import 'package:damma/views/damma_book_view.dart';
import 'package:flutter/material.dart';

class ItemBox extends StatelessWidget {
  final Map<String, dynamic> book;
  ItemBox({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DammBookView(book: book)),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Color.fromARGB(255, 187, 158, 147)))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            book["title"],
                            style: const TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          book["time"] == null
                              ? const Icon(Icons.book_online)
                              : const Icon(Icons.access_time),
                          book["time"] != null
                              ? Text(
                                  ': ${book["time"].toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10),
                                )
                              : Text('Aurthour: ')
                        ],
                      )
                    ],
                  ),
                  Icon(
                    Icons.book,
                    color: Colors.brown[600],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
