import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kma_app/Helper/const/color.dart';
import 'package:kma_app/Helper/const/icon_bottom_navigation.dart';
import 'package:kma_app/View/CalendarScreen/calendar_screen.dart';
import 'package:kma_app/View/CheckinScreen/checkin_screen.dart';
import 'package:kma_app/View/HomeScreen/home_screen.dart';
import 'package:kma_app/View/MenuScreen/menu_screen.dart';
import 'package:kma_app/View/NewsScreen/news_screen.dart';

List<Widget> listScreen = [
  NewsScreen(),
  CalendarScreen(),
  HomeScreen(),
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
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_news, color: endLinearColor,) , text: 'News');
      case TabbarType.calendar:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_calendar, color: endLinearColor,) , text: 'Calendar');
      case TabbarType.home:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_home, color: endLinearColor,) , text: 'Home');
      case TabbarType.checkIn:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_checkin, color: endLinearColor,) , text: 'Check-in');
      case TabbarType.menu:
        return TabbarItem(icon: const Icon(IconButtomNavigation.btn_menu, color: endLinearColor,) , text: 'Menu');
    }
  }
}

class TabbarItem {
  Icon icon;
  String text;

  TabbarItem({required this.icon, required this.text});
}
