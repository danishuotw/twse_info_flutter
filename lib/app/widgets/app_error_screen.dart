import 'package:flutter/material.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text("Error..."),
          ],
        ),
      );
}
