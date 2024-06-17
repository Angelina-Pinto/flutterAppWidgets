import 'package:flutter/material.dart';

const List<MenuItems> appMenuItems = [

  MenuItems(
    title: 'Botones', 
    subtitle: 'varios botones en flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined ),
    
    MenuItems(
    title: 'Tarjetas', 
    subtitle: 'un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card )
];

class MenuItems{

  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
    }); 

  
}
