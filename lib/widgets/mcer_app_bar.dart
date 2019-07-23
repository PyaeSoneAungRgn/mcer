import 'package:flutter/material.dart';

class McerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const McerAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        this.title,
        style: TextStyle(fontSize: 18,)
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
