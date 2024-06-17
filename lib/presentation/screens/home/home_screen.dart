import 'package:flutter/material.dart';
import 'package:flutter_widget_aplication/config/buttons/buttons_screen.dart';
import 'package:flutter_widget_aplication/config/cards/cards_screen.dart';
import 'package:flutter_widget_aplication/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';


class Homescreen extends StatelessWidget {

  static const name = 'home_screen';

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
      physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index){
        //recorriendo lista de appMenuItems 
        final menuItem = appMenuItems[index];
        //obteniendo el valor de objeto 
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    super.key,
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
    //      Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (context) => const ButtonsScreen(),
    //   ),
    // );
    // se puede hacer el llamado de esta forma depenciendo de el link 

    // asi sera el cambio de la pantalla 
    Navigator.pushNamed(context, menuItem.link);

    //context.push(Homescreen.name);
      },

    );
  }
}