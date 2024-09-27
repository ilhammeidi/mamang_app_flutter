import 'package:flutter/material.dart';

class Category {
  final String name;
  final String id;
  final IconData icon;
  final Color color;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color
  });
}

final List<Category> categoryList = [
  Category(id: 'food', name: 'Culinaries', icon: Icons.restaurant, color: Colors.red),
  Category(id: 'services', name: 'Services', icon: Icons.manage_accounts, color: Colors.teal),
  Category(id: 'automotive', name: 'Automotives', icon: Icons.directions_car, color: Colors.indigo),
  Category(id: 'property', name: 'Properties', icon: Icons.home, color: Colors.purple),
  Category(id: 'education', name: 'Educations', icon: Icons.school, color: Colors.cyan),
  Category(id: 'sport', name: 'Sports', icon: Icons.sports_basketball, color: Colors.green),
  Category(id: 'holiday', name: 'Holidays', icon: Icons.surfing, color: Colors.lightBlue),
  Category(id: 'souvenir', name: 'Souvenirs', icon: Icons.shopping_basket, color: Colors.brown),
];
