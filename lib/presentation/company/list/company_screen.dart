import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';
import 'package:twse_info_flutter/presentation/company/detail/company_detail_screen.dart';
import 'package:twse_info_flutter/presentation/company/widgets/company_tile.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppNavBar(
          title: '公司',
          // backgroundColor: Colors.white,
        ),
        body: _buildListView(),
      );

  Widget _buildListView() => ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => CompanyListTile(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => CompanyDetailScreen(),
              ),
            );
          },
          number: '2330',
          title: '台積電',
        ),
        separatorBuilder: (context, index) => const Divider(),
      );
}
