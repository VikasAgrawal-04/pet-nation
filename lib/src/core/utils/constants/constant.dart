import 'package:flutter/material.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_pages/cart_page.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_pages/home_page.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_pages/menu_page.dart';
import 'package:pet_nations/src/views/screens/dashboard/dashboard_pages/pet_page.dart';

class Constant {
  static const List<String> icons = [
    'assets/icons/home.svg',
    'assets/icons/cart.svg',
    'assets/icons/innovation.svg',
    'assets/icons/menu.svg',
  ];

  static const List<Widget> pages = [
    HomePage(),
    CartPage(),
    PetPage(),
    MenuPage(),
  ];

  static const List<String> menuItems = [
    'Order',
    'Wishlist',
    'Pet Profile',
    'Account',
  ];
  static const List<Map<String, dynamic>> serviceSvg = [
    {'name': 'Featured Brand', 'img': 'assets/icons/featured_brands.svg'},
    {'name': 'Pharmacy', 'img': 'assets/icons/pharmacy.svg'},
    {'name': 'Innovation & AI', 'img': 'assets/icons/innovation.svg'},
  ];
}
