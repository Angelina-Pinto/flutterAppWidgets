import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widget_aplication/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
    });



  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 1 ;
  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    

    // if(Platform.isAndroid){
    //   print('Android ');
    // }else{
    //   print('has ${hasNotch} ');
    // }
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value ;
        });
        //con esto se que opcion se seleciono de menu
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);  
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding:  EdgeInsets.fromLTRB(28,hasNotch ? 0 : 20,16,10),

          child: Text('main'),
        ),
        //barriendo lista de items 
        ...appMenuItems
        .sublist(0,3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title),

          ),), 
          Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text('More options'),
            ),

             Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
            ),
 
             ...appMenuItems
        .sublist(3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title),

          ),), 

       

         
      ],
      );
  }
}