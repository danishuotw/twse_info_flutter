import 'package:flutter/material.dart';

class CompanyListTile extends StatelessWidget {
  final String number;
  final String title;
  final void Function()? onTap;

  const CompanyListTile({
    Key? key,
    required this.number,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        title: Text(number + ' ' + title),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 18.0,
        ),
      );
}
