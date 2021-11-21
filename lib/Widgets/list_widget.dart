import 'package:flutter/material.dart';
import 'package:showcaseview_example/Model/list_model.dart';

class BookListWidget extends StatelessWidget {
  final Book book;

  BookListWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 16, top: 8, bottom: 8),
      color: book.isUnread ? Color(0xffFFF6F7) : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFCD8DC),
                  ),
                  child: Center(
                    child: Text(
                      book.sender[0],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      book.sender,
                      style: TextStyle(
                        fontWeight:
                        book.isUnread ? FontWeight.bold : FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      book.sub,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      book.msg,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: book.isUnread
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 50,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  book.date,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  book.isUnread ? Icons.star : Icons.star_border,
                  color: book.isUnread ? Color(0xffFBC800) : Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}