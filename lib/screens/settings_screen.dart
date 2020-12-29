import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem glúten',
                    'Só exibe pratos sem glúten',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = true),
                  ),
                  _createSwitch(
                    'Sem lactose',
                    'Só exibe pratos sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = true),
                  ),
                  _createSwitch(
                    'Vegano',
                    'Só exibe pratos veganos',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = true),
                  ),
                  _createSwitch(
                    'Vegetariano',
                    'Só exibe pratos vegetarianos',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = true),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
