import 'package:flutter/material.dart';

import '../model/book.dart';
import '../widget/user_add_widget.dart';

///@Description TODO
///@Author jd
class BooksListScreen extends StatefulWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  const BooksListScreen({
    Key? key,
    required this.books,
    required this.onTapped,
  }) : super(key: key);

  @override
  State<BooksListScreen> createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  @override
  void initState() {
    debugPrint('BooksListScreen initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    debugPrint('screenWidth:$screenWidth');

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          MyView(),
          Expanded(
            child: ListView(
              children: [
                for (var book in widget.books)
                  ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    onTap: () => widget.onTapped(book),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyView extends StatefulWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  _MyViewState createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  void initState() {
    debugPrint('MyView initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MyView build');
    return Container(
      height: 50,
      color: Colors.redAccent,
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: UserAddWidget(),
                ),
              );
            },
            child: const Text('Add User'),
          ),
        ],
      ),
    );
  }
}
