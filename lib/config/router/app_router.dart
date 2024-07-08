
import 'package:flutter_widget_aplication/config/counter/counter_screen.dart';
import 'package:flutter_widget_aplication/config/progress/progress_screen.dart';
import 'package:flutter_widget_aplication/config/screens/screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_widget_aplication/config/router/app_router.dart';
import '../../presentation/screens/home/home_screen.dart';

// GoRouter configuration
final appRouter  = GoRouter(
  routes: [
    GoRoute(
      name: Homescreen.name,
      path: '/',
      builder: (context, state) => Homescreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
    
      path: '/progress',
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
    
      path: '/snackbar',
      builder: (context, state) =>const  SanckbarScreen(),
    ),
    GoRoute(
    
      path: '/animated',
      builder: (context, state) =>const  AnimatedScreen(),
    ),
    GoRoute(
    
      path: '/Ui_controls',
      builder: (context, state) =>const  UiControlsScreen(),
    ),
    GoRoute(
    
      path: '/tutorial',
      builder: (context, state) =>const  AppTutorialScreen(),
    ),
    GoRoute(
    
      path: '/infinite',
      builder: (context, state) =>const  InfiniteScrollScreen(),
    ),
    GoRoute(
    
      path: '/counter',
      builder: (context, state) =>const  CounterScreen(),
    ),
     GoRoute(
    
      path: '/theme-changer',
      builder: (context, state) =>const  ThemeChangeScreen(),
    ),

    

  ],
);