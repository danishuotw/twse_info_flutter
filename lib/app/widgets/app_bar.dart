import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const AppNavBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(title),
        centerTitle: true,
      );

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
