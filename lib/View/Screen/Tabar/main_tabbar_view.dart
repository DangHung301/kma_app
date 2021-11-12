import 'package:flutter/material.dart';
import 'package:kma_app/Helper/const/color.dart';
import 'package:kma_app/View/Screen/Tabar/tabbar_item.dart';
import 'package:kma_app/View/Screen/Tabar/tabbar_viewModel.dart';
import 'package:kma_app/View/Widget/app_bar_default.dart';

class MainTabbarView extends StatefulWidget {
  const MainTabbarView({Key? key, required this.viewModel}) : super(key: key);
  final TabbarViewModel viewModel;
  @override
  _MainTabbarViewState createState() => _MainTabbarViewState();
}

class _MainTabbarViewState extends State<MainTabbarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(name: 'NGUYEN DANG HUNG',),

      body: IndexedStack(
        children: listScreen,
        index: widget.viewModel.selectedIndex
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 18,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.viewModel.selectedIndex,
        elevation: 10.0,
        selectedItemColor: endLinearColor,
        onTap: (index) {
          widget.viewModel.onTap(index);
          setState(() {
          });
        },
        unselectedItemColor: endLinearColor.withOpacity(0.36),
        items: getListTabbarItem.map((e) => BottomNavigationBarItem(icon: e.icon, label: e.text)).toList(),
      ),
    );
  }
}
