import 'package:flutter/material.dart';
import 'package:kma_app/View/Tabar/tabbar_item.dart';
import 'package:kma_app/View/Widget/app_bar_default.dart';

class MainTabbarView extends StatefulWidget {
  const MainTabbarView({Key? key}) : super(key: key);

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
        index: 2
        ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 18,
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        elevation: 10.0,
        selectedItemColor:
        Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        items: getListTabbarItem.map((e) => BottomNavigationBarItem(icon: e.icon, label: e.text)).toList(),
      ),
    );
  }
}
