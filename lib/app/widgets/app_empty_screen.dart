import 'package:flutter/material.dart';

class AppEmptyScreen extends StatelessWidget {
  const AppEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Data Found"),
          ],
        ),
      );
}
