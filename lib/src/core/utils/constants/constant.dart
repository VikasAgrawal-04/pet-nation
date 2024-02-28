import 'package:flutter/material.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_pages/cart_page.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_pages/home_page.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_pages/menu_page.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_pages/profile_page.dart';

class Constant {
  static const List<String> icons = [
    'assets/icons/home.svg',
    'assets/icons/cart.svg',
    'assets/icons/profile.svg',
    'assets/icons/menu.svg'
  ];

  static const List<Widget> pages = [
    HomePage(),
    CartPage(),
    ProfilePage(),
    MenuPage()
  ];

  static const List<String> menuItems = [
    'Order',
    'Wishlist',
    'Pet Profile',
    'Account'
  ];
}
