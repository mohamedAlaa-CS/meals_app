import 'package:flutter/material.dart';
import 'package:meal_app/views/main_drawer.dart';
import 'package:meal_app/views/tab_view.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool _veganFilter = false;
  bool _lactoseFilter = false;
  bool _gultenFilter = false;
  bool _vegetarianFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(
      //   onselected: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => const TabView(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.vegan: _veganFilter,
            Filter.lactose: _lactoseFilter,
            Filter.gluten: _gultenFilter,
            Filter.vegetarian: _vegetarianFilter,
          });
          return false;
        },
        child: Column(
          children: [
            customSwitch(
                title: 'vagan',
                subtitle: 'only include vegan meals',
                value: _veganFilter,
                onChanged: (value) {
                  setState(() {
                    _veganFilter = value;
                  });
                }),
            customSwitch(
                title: 'isLactoseFree',
                subtitle: 'only include lactose free recipes',
                value: _lactoseFilter,
                onChanged: (value) {
                  setState(() {
                    _lactoseFilter = value;
                  });
                }),
            customSwitch(
                title: 'isGlutenFree',
                subtitle: 'only include gluten free meals',
                value: _gultenFilter,
                onChanged: (value) {
                  setState(() {
                    _gultenFilter = value;
                  });
                }),
            customSwitch(
                title: 'isVegetarian',
                subtitle: 'only include vegetarian recipes',
                value: _vegetarianFilter,
                onChanged: (value) {
                  setState(() {
                    _vegetarianFilter = value;
                  });
                }),
          ],
        ),
      ),
    );
  }

  SwitchListTile customSwitch(
      {required bool value,
      required Function(bool) onChanged,
      required String title,
      required String subtitle}) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

enum Filter {
  vegan,
  lactose,
  gluten,
  vegetarian,
}
