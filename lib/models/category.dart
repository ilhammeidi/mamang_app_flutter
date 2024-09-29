import 'package:flutter/material.dart';

class Category {
  final String name;
  final String id;
  final IconData icon;
  final String image;
  final Color color;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.image,
  });
}

final List<Category> categoryList = [
  Category(id: 'food', name: 'Culinaries', icon: Icons.restaurant, color: Colors.red, image: 'assets/images/categories/food.png'),
  Category(id: 'services', name: 'Services', icon: Icons.manage_accounts, color: Colors.teal, image: 'assets/images/categories/service.png'),
  Category(id: 'automotive', name: 'Automotives', icon: Icons.directions_car, color: Colors.indigo, image: 'assets/images/categories/automotive.png'),
  Category(id: 'property', name: 'Properties', icon: Icons.home, color: Colors.purple, image: 'assets/images/categories/property.png'),
  Category(id: 'education', name: 'Educations', icon: Icons.school, color: Colors.cyan, image: 'assets/images/categories/education.png'),
  Category(id: 'sport', name: 'Sports', icon: Icons.sports_basketball, color: Colors.green, image: 'assets/images/categories/sport.png'),
  Category(id: 'holiday', name: 'Holidays', icon: Icons.surfing, color: Colors.lightBlue, image: 'assets/images/categories/holiday.png'),
  Category(id: 'souvenir', name: 'Souvenirs', icon: Icons.shopping_basket, color: Colors.brown, image: 'assets/images/categories/souvenir.png'),
];
