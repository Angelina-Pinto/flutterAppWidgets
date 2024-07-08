import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_aplication/config/theme/app_theme.dart';
import 'package:flutter_widget_aplication/presentation/provider/theme_provider.dart';


class ThemeChangeScreen extends ConsumerWidget {
  
  static const name = 'theme_changer_screen';

  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final bool isDarkmode = ref.watch(darkModeProvider);
     
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(darkModeProvider.notifier).update((state) => !state,);
            }, 
            icon: Icon(isDarkmode? Icons.dark_mode_outlined : Icons.light_mode_outlined ))
        ],
      ),
      body: const _themeChangerView(),
    );
  }
}

class _themeChangerView extends ConsumerWidget {
  const _themeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int colorChange = ref.watch(selectedIndexColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
      final Color color = colors[index];

      return RadioListTile(
        title: Text('Este color', style: TextStyle(color: color),),
        subtitle: Text('${color.value}'),
        activeColor: color,
        value: index, 
        groupValue: colorChange, 
        onChanged: (value) {
          //TODO: notificar el cambio al lugar
          ref.read(selectedIndexColorProvider.notifier).update((colorChange)=>colorChange=index) ;
        },);
    },);
  }
}