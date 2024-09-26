import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});


  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(name: 'Culinaries', icon: Icons.restaurant, color: Colors.red),
      Category(name: 'Services', icon: Icons.manage_accounts, color: Colors.teal),
      Category(name: 'Automotives', icon: Icons.directions_car, color: Colors.indigo),
      Category(name: 'Properties', icon: Icons.home, color: Colors.purple),
      Category(name: 'Educations', icon: Icons.school, color: Colors.cyan),
      Category(name: 'Sports', icon: Icons.sports_basketball, color: Colors.green),
      Category(name: 'Holidays', icon: Icons.surfing, color: Colors.lightBlue),
      Category(name: 'Souvenirs', icon: Icons.shopping_basket, color: Colors.brown),
    ];

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisExtent: 100,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: categories.length,
        (BuildContext context, int index) {
          final item = categories[index];
          return InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(60),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: item.color.withOpacity(0.25),
                    radius: 16,
                  ),
                  Icon(item.icon, size: 42, color: item.color)
                ],
              ),
              SizedBox(height: spacingUnit(1)),
              Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600))
            ]),
          );
        }
      ),
    );
  }
}