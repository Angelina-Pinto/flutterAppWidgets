import 'package:flutter_widget_aplication/presentation/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter  = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Homescreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => Homescreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => Homescreen(),
    ),
  ],
);