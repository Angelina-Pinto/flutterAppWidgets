import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subtittle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtittle, 
    required this.link, 
    required this.icon
    });

}
const appMenuItems =<MenuItem>[
  MenuItem(
    title: 'Botones', 
    subtittle: 'varios botones en flutter', 
    link: '/botones', 
    icon: Icons.smart_button
    )
];