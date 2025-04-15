import 'package:expenses/views/expanse_home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var myColorScheme2 =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 189, 33, 90));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanses App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorScheme2,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: myColorScheme2.onPrimaryContainer,
          foregroundColor: myColorScheme2.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: myColorScheme2.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myColorScheme2.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: myColorScheme2.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
      ),
      home: ExpanseHomeView(),
    );
  }
}
