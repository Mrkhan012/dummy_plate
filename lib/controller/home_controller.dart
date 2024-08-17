// ignore_for_file: unused_field

import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Map<String, String>> cardData = [
    {"title": "Default Platters", "image": "assets/images/craft_.png"},
    {"title": "Craft Your Own", "image": "assets/images/craft.png"},
  ];

  final List<Map<String, String>> boxdata = [
    {"title": "3CP", "image": "assets/images/boxx.svg"},
    {"title": "5CP", "image": "assets/images/box_.svg"},
    {"title": "5CP", "image": "assets/images/box.svg"},
  ];
  final List<Map<String, dynamic>> boxData = [
    {
      'headline': 'Delivery Box 1',
      'items': '3 Live Counter\n4 Main\n3 Desserts',
      'price': '₹299',
      'image': 'assets/images/dish.png', // Path to your image
    },
    {
      'headline': 'Delivery Box 2',
      'items': '2 Live Counter\n5 Main\n4 Desserts',
      'price': '₹399',
      'image': 'assets/images/dish.png', // Path to your image
    },
    // Add more data as needed
  ];

  final List<Map<String, dynamic>> dishData = [
    {
      'image': 'assets/images/image.png', // Path to your image
      'headline': 'Panjabi Special Menu', 'headline1': 'Panjabi Special Menu',
      'headline2': 'Another Dish 1',
      'headline3': 'Yet Another Dish 1',

      'counters': '6 Categories & 9 Items',
    },
    {
      'image': 'assets/images/image.png', // Path to your image
      'headline': 'Panjabi Special Menu',
      'headline1': 'Panjabi Special Menu',
      'headline2': 'Another Dish 1',
      'headline3': 'Yet Another Dish 1',
      'counters': '6 Categories & 9 Items',
    },
    // Add more dishes as needed
  ];

  final List<Map<String, dynamic>> meals = [
    {
      'name': 'Meal Box 1',
      'guests': 'Min 10 Guests',
      'image': 'assets/images/paltee.png',
    },
    {
      'name': 'Catering',
      'guests': 'Min 15 Guests',
      'image': 'assets/images/platerr.png',
    },
  ];

  final List<Map<String, dynamic>> service = [
    {
      'image': 'assets/images/Mask.png', // Path to your image
      'headline': 'Delivery',
      'headline1': 'Panjabi Special Menu',
      'headline2': 'Another Dish 1',
      'headline3': 'Yet Another Dish 1',

      'counters1': 'High Quality Disposable Cutlery',
      'counters2': 'High Quality Disposable Cutlery',

      'counters3': 'High Quality Disposable Cutlery',
    },
    {
      'image': 'assets/images/Mask.png', // Path to your image
      'headline': 'Delivery',
      'headline1': 'Panjabi Special Menu',
      'headline2': 'Another Dish 1',
      'headline3': 'Yet Another Dish 1',
      'counters1': 'High Quality Disposable Cutlery',
      'counters2': 'High Quality Disposable Cutlery',

      'counters3': 'High Quality Disposable Cutlery',
    },
    // Add more dishes as needed
  ];
}
