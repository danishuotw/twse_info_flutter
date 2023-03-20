import 'package:flutter/material.dart';

class CompanyLabelText extends StatelessWidget {
  const CompanyLabelText({
    Key? key,
    required this.label,
    required this.title,
  }) : super(key: key);

  final String label;
  final String title;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      );
}
