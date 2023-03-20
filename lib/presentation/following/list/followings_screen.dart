import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';
import 'package:twse_info_flutter/presentation/company/detail/company_detail_screen.dart';
import 'package:twse_info_flutter/presentation/company/list/widgets/company_tile.dart';

class FollowingsScreen extends StatefulWidget {
  const FollowingsScreen({Key? key}) : super(key: key);

  @override
  State<FollowingsScreen> createState() => _FollowingsScreenState();
}

class _FollowingsScreenState extends State<FollowingsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildListView(),
      );

  AppNavBar _buildAppBar() => const AppNavBar(
        title: '公司',
      );

  Widget _buildListView() => ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.cancel),
          ),
          onDismissed: (direction) => print('onDismissed $direction'),
          key: ValueKey('$index'),
          child: CompanyListTile(
            onTap: () => _navigateDetail(context, ''),
            number: '2330',
            title: '台積電',
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
      );

  void _navigateDetail(BuildContext context, String id) {
    context.pushNamed(CompanyDetailScreen.route, params: {'companyId': id});
  }

  void _removeCompanyAt(int index) {}
}
