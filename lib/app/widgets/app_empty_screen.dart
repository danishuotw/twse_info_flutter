import 'package:flutter/material.dart';

class AppEmptyScreen extends StatelessWidget {
  const AppEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("No Data Found"),
          ],
        ),
      );
}
