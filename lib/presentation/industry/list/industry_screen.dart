import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';
import 'package:twse_info_flutter/presentation/company/list/company_screen.dart';

class IndustryScreen extends StatefulWidget {
  const IndustryScreen({Key? key}) : super(key: key);

  @override
  State<IndustryScreen> createState() => _IndustryScreenState();
}

class _IndustryScreenState extends State<IndustryScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppNavBar(
          title: '產業別',
          // backgroundColor: Colors.white,
        ),
        body: _buildListView(),
      );

  Widget _buildListView() => ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => CompanyScreen(),
              ),
            );
          },
          title: Text('水泥工業 (30)'),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 18.0,
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
      );
}
