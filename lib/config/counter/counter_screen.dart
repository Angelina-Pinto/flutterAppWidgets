import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_aplication/presentation/provider/counter_provider.dart';
import 'package:flutter_widget_aplication/presentation/provider/theme_provider.dart';


class CounterScreen extends ConsumerWidget {
  static const name = 'counter';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final int clicCounter = ref.watch(counterProvider);
    final bool isDarkmode = ref.watch(darkModeProvider);

    return Scaffold(
  
      appBar: AppBar(
        title: Text('valor 10'),
        actions: [
          IconButton(
            onPressed: (){
               ref.read(darkModeProvider.notifier).update((isDarkmode)=>!isDarkmode) ;
            }, 
            
            icon: Icon(isDarkmode ? Icons.dark_mode_outlined: Icons.light_mode_outlined),
            //icon: Icon(Icons.dark_mode_outlined)
            )
        ],
      ),
      body: Center(
        child: Text('valor $clicCounter', style: Theme.of(context).textTheme.titleLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterProvider.notifier).state ++;
        },
        child: Icon(Icons.add),
        ),
    );
  }
}