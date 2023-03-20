import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';
import 'package:twse_info_flutter/app/widgets/app_divider.dart';
import 'package:twse_info_flutter/presentation/company/detail/widgets/company_label_text.dart';

class CompanyDetailScreen extends StatefulWidget {
  static const route = '/companyDetail/:companyId';

  final String companyId;

  const CompanyDetailScreen({
    Key? key,
    required this.companyId,
  }) : super(key: key);

  @override
  State<CompanyDetailScreen> createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(viewModelBuilder: () => , ,
      builder: (context, model, child) {
        return Scaffold(
          appBar: const AppNavBar(
            title: '公司簡介',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  _buildTitleWidget(),
                  _buildInfoWidget(),
                  const AppDivider(),
                  _buildContactWidget(),
                  const AppDivider(),
                  _buildICapitalWidget(),
                ],
              ),
            ),
          ),
        );
      });

  Widget _buildTitleWidget() => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('基本資料'),
            _buildLinkableText(),
          ],
        ),
      );

  Widget _buildLinkableText() => GestureDetector(
        onTap: () {
          print('onTap!!!!');
        },
        child: Row(
          children: [
            Text(
              '台灣水泥股份有限公司',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 4.0),
            Icon(Icons.link),
          ],
        ),
      );

  Widget _buildInfoWidget() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.0,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerLeft,
            child: CompanyLabelText(
              label: '董事長',
              title: '張安平',
            ),
          );
        },
      );

  Widget _buildContactWidget() => GridView.builder(
        padding: EdgeInsets.only(top: 30.0),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.0,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerLeft,
            child: CompanyLabelText(
              label: '董事長',
              title: '張安平',
            ),
          );
        },
      );

  Widget _buildICapitalWidget() => ListView.separated(
        padding: EdgeInsets.only(top: 30.0),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) => Align(
          alignment: Alignment.centerLeft,
          child: CompanyLabelText(
            label: '董事長',
            title: '張安平',
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16.0,
        ),
      );
}
