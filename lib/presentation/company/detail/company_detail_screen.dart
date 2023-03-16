import 'package:flutter/material.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';

class CompanyDetailScreen extends StatefulWidget {
  const CompanyDetailScreen({Key? key}) : super(key: key);

  @override
  State<CompanyDetailScreen> createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavBar(
        title: '公司簡介',
      ),
      body: Container(),
    );
  }
}
