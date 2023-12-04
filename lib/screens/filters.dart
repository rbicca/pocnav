import 'package:flutter/material.dart';
// import 'package:pocnav/screens/tabs.dart';
// import 'package:pocnav/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glu = false;
  var _lac = false;
  var _veget = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    _glu = widget.currentFilters[Filter.glutenFree]!;
    _lac = widget.currentFilters[Filter.lactoseFree]!;
    _veget = widget.currentFilters[Filter.vegetarian]!;
    _vegan = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context)
      //         //.push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //         .pushReplacement(
      //             MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glu,
            Filter.lactoseFree: _lac,
            Filter.vegetarian: _veget,
            Filter.vegan: _vegan
          });
          return false; //Aborta a navegação, pois usa o nosso pop
          //O async na declaração transforma o false em Future<false>
        },
        child: Column(
          children: [
            SwitchListTile(
                title: Text('Sem glútem',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Apenas bóia sem glútem',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
                value: _glu,
                onChanged: (isChecked) {
                  setState(() {
                    _glu = isChecked;
                  });
                }),
            SwitchListTile(
                title: Text('Sem lactose',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Apenas bóia sem lactose',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
                value: _lac,
                onChanged: (isChecked) {
                  setState(() {
                    _lac = isChecked;
                  });
                }),
            SwitchListTile(
                title: Text('Vegatariano',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Apenas bóia vegetariana',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
                value: _veget,
                onChanged: (isChecked) {
                  setState(() {
                    _veget = isChecked;
                  });
                }),
            SwitchListTile(
                title: Text('Vegano',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                subtitle: Text('Apenas bóia vegana',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
                value: _vegan,
                onChanged: (isChecked) {
                  setState(() {
                    _vegan = isChecked;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
