import 'package:flutter/material.dart';

class DesignScreens extends StatelessWidget {
  const DesignScreens({super.key});

  @override
  Widget build(BuildContext context) {
    bool isdeveloper = true;
    return ListView(
        children: [
          SwitchListTile(
            value: isdeveloper, 
            title: const Text('Developer Mode'),
            subtitle: const Text('controllers'),
            onChanged: null )
        ],
    );
  }
}