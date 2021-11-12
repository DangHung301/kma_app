import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kma_app/Helper/const/icon_bottom_navigation.dart';
import 'package:kma_app/View/Screen/CalendarScreen/calendar_screen.dart';
import 'package:kma_app/View/Screen/CheckinScreen/checkin_screen.dart';
import 'package:kma_app/View/Screen/HomeScreen/home_screen.dart';
import 'package:kma_app/View/Screen/HomeScreen/home_view_model.dart';
import 'package:kma_app/View/Screen/MenuScreen/menu_screen.dart';
import 'package:kma_app/View/Screen/NewsScreen/news_screen.dart';

List<Widget> listScreen = [
  NewsScreen(),
  CalendarScreen(),
  HomeScreen(viewModel: HomeViewModel(),),
  CheckinScreen(),
  MenuScreen()
];

List<TabbarItem> getListTabbarItem = [
  TabbarType.news.getTabbarItem(),
  TabbarType.calendar.getTabbarItem(),
  TabbarType.home.getTabbarItem(),
  TabbarType.checkIn.getTabbarItem(),
  TabbarType.menu.getTabbarItem(),
];

enum TabbarType { news, calendar, home, checkIn, menu }

extension TabbarEnum on TabbarType {
  int get index {
    switch (this) {
      case TabbarType.news:
        return 0;
      case TabbarType.calendar:
        return 1;
      case TabbarType.home:
        return 2;
      case TabbarType.checkIn:
        return 3;
      case TabbarType.menu:
        return 4;
    }
  }

  TabbarItem getTabbarItem() {
    switch (this) {
      case TabbarType.news:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_news) , text: 'News');
      case TabbarType.calendar:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_calendar,) , text: 'Calendar');
      case TabbarType.home:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_home) , text: 'Home');
      case TabbarType.checkIn:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_checkin) , text: 'Check-in');
      case TabbarType.menu:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_menu) , text: 'Menu');
    }
  }
}

class TabbarItem {
  Icon icon;
  String text;

  TabbarItem({required this.icon, required this.text});
}
