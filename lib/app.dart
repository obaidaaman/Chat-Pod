import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:space_pod/screens/auth/login/ui/login.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

          brightness: Brightness.light,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.grey.shade900,
          primaryColor: Colors.grey.shade900),
      home: const LoginPage(),
    );
  }
}

