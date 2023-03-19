import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/presentation/home/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) => Scaffold(
          body: viewModel.getPages(),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: "industries"),
              BottomNavigationBarItem(icon: Icon(Icons.star_border), label: "watch"),
            ],
            onTap: viewModel.onItemTapped,
            currentIndex: viewModel.selectedIndex,
          ),
        ),
      );
}