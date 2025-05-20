import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/tools/app_color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  MyAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_book_rounded,color: textColor2,),
          ),
          Text(title, 
            style: TextStyle(
              color: textColor2, 
              fontSize: 26,
              fontFamily: "PoetsenOne")),
        ],
      ),
      backgroundColor: mainColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
