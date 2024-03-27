import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onselected});
  final void Function(String identifier) onselected;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.lightBlue,
              Colors.lightBlueAccent
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Cooking up',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onselected('meals');
            },
            leading: const Icon(Icons.restaurant),
            title: const Text(
              'Meals ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              onselected('filters');
            },
            leading: const Icon(Icons.settings),
            title: const Text(
              'Filters ',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
