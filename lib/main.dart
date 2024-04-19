import 'package:dishdash/auth/login_or_register.dart';
import 'package:dishdash/models/resturant.dart';
import 'package:flutter/material.dart';
import 'package:dishdash/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // theme
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

        // resturant
        ChangeNotifierProvider(
          create: (context) => Resturant(),
        ),
      ],
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
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
