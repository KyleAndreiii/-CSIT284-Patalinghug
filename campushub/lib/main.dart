import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider<FavoritesProvider>(
      create: (_) => FavoritesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusHub',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F6FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: CategoriesScreen(),
    );
  }
}