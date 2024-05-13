
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:space_pod/screens/auth/login/bloc/auth_log_bloc.dart';
import 'package:space_pod/screens/auth/login/ui/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_pod/screens/home/bloc/chat_bloc.dart';
import 'package:space_pod/screens/home/ui/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:  [
      BlocProvider<AuthLogBloc>(create: (context) => AuthLogBloc()),
      BlocProvider<ChatBloc>(create: (context) => ChatBloc()),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.grey.shade900,
          primaryColor: Colors.grey.shade900),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyHomePage(authLogBloc: AuthLogBloc(),);

            }
            else {
              return  LoginPage();
            }
          }
      ),
    ));
  }
}
