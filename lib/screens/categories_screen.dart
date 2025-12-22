import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
        name: 'Display',
        icon: Icons.screen_share,
        itemCount: 42,
      ),
      Category(
        name: 'Spare Parts',
        icon: Icons.build,
        itemCount: 128,
      ),
      Category(
        name: 'Hardware',
        icon: Icons.handyman,
        itemCount: 67,
      ),
      Category(
        name: 'LCD',
        icon: Icons.tv,
        itemCount: 35,
      ),
      Category(
        name: 'Touch Pad',
        icon: Icons.touch_app,
        itemCount: 29,
      ),
      Category(
        name: 'Accessories',
        icon: Icons.devices_other,
        itemCount: 89,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              title: category.name,
              icon: category.icon,
              itemCount: category.itemCount,
              onTap: () {
                // Navigate to category detail page
                // For now, just show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Opening ${category.name} category'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}