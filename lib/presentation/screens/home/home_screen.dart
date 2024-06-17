import 'package:flutter/material.dart';
import 'package:flutter_widget_aplication/config/menu/menu_items.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('flutter + material 3'),
      ),
      body:const  _homeView(),
    );
  }
}

class _homeView extends StatelessWidget {
  const _homeView();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index){
        //recorriendo lista de appMenuItems 
        final menuItem = appMenuItems[index];
        //obteniendo el valor de objeto 
        return ListTile(
          title: Text(menuItem.title),
          subtitle: Text(menuItem.subtitle),
        );
      },
    );
  }
}