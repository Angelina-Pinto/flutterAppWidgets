// Estado => isDarkProvider = boolean

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_aplication/config/theme/app_theme.dart';

final darkModeProvider = StateProvider<bool>((ref) => false);

//listado de colores inmutable 
final colorListProvider = Provider((ref) => colorList);

//un simple entero 
final  selectedIndexColorProvider  = StateProvider<int>((ref) => 1);

