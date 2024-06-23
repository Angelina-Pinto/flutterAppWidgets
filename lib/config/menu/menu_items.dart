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
    icon: Icons.credit_card ),

    MenuItems(
    title: 'ProgressIndicators', 
    subtitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.donut_large),

    MenuItems(
    title: 'Snackbars y diálogos', 
    subtitle: 'Indicadores en pantalla', 
    link: '/snackbar', 
    icon: Icons.info_outline),

    MenuItems(
    title: 'Animated conatiner', 
    subtitle: 'Steteful widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank),

    MenuItems(
    title: 'UI Controls + Titles ', 
    subtitle: 'Una serie de controles en flutter', 
    link: '/ui_controls', 
    icon: Icons.car_rental_outlined),

    MenuItems(
    title: 'Introduccion a la aplicacion ', 
    subtitle: 'Pequeño tutorial', 
    link: '/ui_controls', 
    icon: Icons.car_rental_outlined)
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
