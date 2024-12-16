import 'package:damma/assets/item_box.dart';

class BookItem {
  final int bookId;
  final String title;
  final String image;
  final String context;
  final int type;
  DateTime? datetime;
  bool is_recently_read = false;

  BookItem({
    required this.bookId,
    required this.title,
    required this.image,
    required this.context,
    required this.type,
    DateTime? datetime,
    // ignore: non_constant_identifier_names
    this.is_recently_read = false,
  }) : datetime = datetime ?? null;

  bool isRecentlyRead() {
    return false;
  }

  @override
  String toString() {
    return 'Book{bookId: $bookId}';
  }
}
