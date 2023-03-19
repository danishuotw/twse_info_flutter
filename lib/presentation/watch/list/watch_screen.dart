import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';
import 'package:twse_info_flutter/presentation/company/list/companies_screen.dart';
import 'package:twse_info_flutter/presentation/company/list/widgets/company_tile.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
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
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Colors.red,
            child: Icon(Icons.cancel),
          ),
          onDismissed: (direction) {
            print('onDismissed $direction');
          },
          key: ValueKey('$index'),
          child: CompanyListTile(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) => CompaniesScreen(
                    industryId: '',
                  ),
                ),
              );
            },
            number: '2330',
            title: '台積電',
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
      );

  void _removeCompanyAt(int index) {}
}
