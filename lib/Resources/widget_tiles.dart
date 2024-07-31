import 'package:flutter/material.dart';

class MyWidgets extends StatefulWidget {
  const MyWidgets({super.key});

  @override
  State<MyWidgets> createState() => _MyWidgetsState();

  Widget descWid(String data, bool read, Function() toggleRead) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          data,
          maxLines: !read ? 7 : null,
          overflow: !read ? TextOverflow.ellipsis : null,
          style: const TextStyle(
            height: 1.5,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: toggleRead,
          child: Icon(
            !read ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
            color: Colors.black,
            size: 44,
          ),
        )
      ],
    );
  }
}

class _MyWidgetsState extends State<MyWidgets> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
