import 'package:flutter/material.dart';
import 'package:flutter_widget_aplication/config/buttons/buttons_screen.dart';
import 'package:flutter_widget_aplication/config/cards/cards_screen.dart';
import 'package:flutter_widget_aplication/config/theme/app_theme.dart';
import 'package:flutter_widget_aplication/presentation/screens/home/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(selectedColor: 1).getTheme(),
      title: 'Material App',
      home: const Homescreen(),
      routes: {
        '/buttons':  (context) => const ButtonsScreen(),
        '/cards':  (context) => const CardsScreen()
      },
    );
  }
}