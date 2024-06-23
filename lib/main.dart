import 'package:flutter_widget_aplication/config/progress/progress_screen.dart';
import 'package:flutter_widget_aplication/config/theme/app_theme.dart';
import 'package:flutter_widget_aplication/config/screens/screen.dart';
import 'package:flutter_widget_aplication/config/router/app_router.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).getTheme(),
      title: 'Material App',
     
    );
  }
}
