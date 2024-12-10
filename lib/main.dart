import 'package:app_maquinista/homePage.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Automoción App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0066CC),
            primary: const Color(0xFF0066CC),
            secondary: const Color(0xFFFFDD00),
            background: const Color(0xFF2C2C2E),
            surface: const Color(0xFF3A3A3A),
            brightness: Brightness.dark,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onBackground: Colors.white,
            onSurface: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFF1E1E1E),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(186, 1, 80, 160),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            iconTheme: IconThemeData(color: Color(0xFFFFDD00)),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        home: Home(),
      );
  }
}
