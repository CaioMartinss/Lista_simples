import 'package:flutter/material.dart';
import 'home_page.dart';

void main() async {
  // init the hive

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 26, 36, 46),
          colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255, 29, 49, 49),
          ),
        ));

  }
}
