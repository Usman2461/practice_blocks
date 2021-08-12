import 'package:flutter/material.dart';
import 'package:practice_blocks/screens/login_screen.dart';
import 'package:practice_blocks/services/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
          title: "bloc pattern",
          home: Scaffold(
            body: LoginScreen(),
          )),
    );
  }
}
