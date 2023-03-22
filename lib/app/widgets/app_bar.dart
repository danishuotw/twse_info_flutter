import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const AppNavBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      );

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
