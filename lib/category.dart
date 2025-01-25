import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.directions_car, 'label': 'Cars'},
      {'icon': Icons.apartment, 'label': 'Properties'},
      {'icon': Icons.phone_android, 'label': 'Mobiles'},
      {'icon': Icons.work, 'label': 'Jobs'},
      {'icon': Icons.pedal_bike, 'label': 'Bikes'},
      {'icon': Icons.kitchen, 'label': 'Electronics & Appliances'},
      {'icon': Icons.local_shipping, 'label': 'Commercial Vehicles & Spares'},
      {'icon': Icons.chair, 'label': 'Furniture'},
      {'icon': Icons.style, 'label': 'Fashion'},
      {'icon': Icons.book, 'label': 'Books, Sports & Hobbies'},
      {'icon': Icons.emoji_nature, 'label': 'Pots'},
      {'icon': Icons.design_services, 'label': 'Services'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a category'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(categories[index]['icon'] as IconData, color: Colors.black),
            title: Text(
              categories[index]['label'] as String,
              style: const TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16.0),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onTap: () {
              // Handle category tap
            },
          );
        },
        padding: const EdgeInsets.all(8.0),
      ),
      backgroundColor: Colors.black, // Background color for the page
    );
  }
}


