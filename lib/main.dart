import 'package:dating_app_clone/pages/welcome.dart';
import 'package:dating_app_clone/routes/page_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tander',
      theme: ThemeData(
        fontFamily: 'Mulish',
        useMaterial3: true,
      ),
      home: const WelcomePage(),
      getPages: AppRoute.pages,
    );
  }
}
