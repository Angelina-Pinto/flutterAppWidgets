
import 'package:flutter_widget_aplication/config/screens/screen.dart';
import 'package:go_router/go_router.dart';

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
  ],
);