import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_aplication/config/progress/progress_screen.dart';
import 'package:flutter_widget_aplication/config/theme/app_theme.dart';
import 'package:flutter_widget_aplication/config/screens/screen.dart';
import 'package:flutter_widget_aplication/config/router/app_router.dart';
import 'package:flutter_widget_aplication/presentation/provider/theme_provider.dart';
void main() => runApp(
  ProviderScope(
    child:const MyApp())
  );

class MyApp extends ConsumerWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool darkMode = ref.watch(darkModeProvider);
    final int selectedColor = ref.watch(selectedIndexColorProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedColor, isDarkmode: darkMode).getTheme(),
      title: 'Material App',
     
    );
  }
}
