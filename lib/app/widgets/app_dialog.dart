import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppDialogResult {
  confirm,
  cancel;
}

class AppDialog {
  AppDialog._();

  static Future<AppDialogResult?> show(
    BuildContext context, {
    String? title,
    String? content,
    String? confirmLabel,
    String? cancelLabel,
  }) {
    return showDialog<AppDialogResult>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title ?? ''),
          content: Text(content ?? ''),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                cancelLabel ?? '取消',
                style: const TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop(AppDialogResult.cancel);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                confirmLabel ?? '確認',
                style: const TextStyle(color: Colors.deepPurple),
              ),
              onPressed: () {
                Navigator.of(context).pop(AppDialogResult.confirm);
              },
            ),
          ],
        );
      },
    );
  }
}
