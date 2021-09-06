import 'package:flutter/material.dart';
import 'package:flutter_first_app_balcoder/ui/home_page.dart';
import 'package:flutter_first_app_balcoder/ui/user/user_form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserFormPage(),
    );
  }
}
