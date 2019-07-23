import 'package:flutter/material.dart';

class McerDrawer extends StatelessWidget implements PreferredSizeWidget {
  final Color homeColor;
  final Color creditColor;
  final Color aboutColor;

  const McerDrawer({Key key, this.homeColor, this.creditColor, this.aboutColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: FractionalOffset.center,
            color: Colors.yellow,
            child: Text(
              'M C E R',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: this.homeColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: this.homeColor,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: this.creditColor,
            ),
            title: Text(
              'Credit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: this.creditColor,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/credit');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.free_breakfast,
              color: this.aboutColor,
            ),
            title: Text(
              'About',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: this.aboutColor,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
