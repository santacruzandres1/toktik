import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_providers.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false, //esto es para que se lance el contrusctor inmediatamente cuando se cree la referancia DicoverProvider, es decir , se cree la instancia y que ya este listo
          create: (_) => DiscoverProvider()..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tok Tik',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
