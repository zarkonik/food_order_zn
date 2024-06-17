import "package:flutter/material.dart";
import 'package:food_order_zn/auth/login_or_register.dart';
import 'package:food_order_zn/models/restaurant.dart';
import 'package:food_order_zn/pages/register_page.dart';
import 'package:food_order_zn/themes/theme_provider.dart';

import 'package:provider/provider.dart';
import 'pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
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
