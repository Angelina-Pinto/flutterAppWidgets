import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.black,
  Colors.orange,
  Colors.white,
  Colors.pink,
  Colors.red,
  Colors.yellow,
  Colors.blue
];

class AppTheme{

  final int selectedColor;
  final bool isDarkmode;

  AppTheme({ 
    this.selectedColor = 0 ,
    this.isDarkmode = false
    
    }):assert(selectedColor >= 0 , 'el color debe de ser mayor a 0'),
    assert(selectedColor < colorList.length, 'selected color must be less or equal than ${colorList.length}');

    ThemeData getTheme () => ThemeData(
      //cambia el tema de la aplicacion 
      brightness: isDarkmode? Brightness.dark: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false
      )
    );
}