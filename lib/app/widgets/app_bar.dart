import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const AppNavBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
