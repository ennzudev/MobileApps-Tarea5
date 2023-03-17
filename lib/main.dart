import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/home_page.dart';
import 'package:tip_time/tip_time_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 255, 89, 0),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => TipTimeProvider(),
        child: HomePage(),
      ),
    );
  }
}
