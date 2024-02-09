import 'package:dating_app_clone/firebase_options.dart';
import 'package:dating_app_clone/pages/welcome.dart';
import 'package:dating_app_clone/routes/page_route.dart';
import 'package:dating_app_clone/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: RouteName.splashScreenPage,
      getPages: AppRoute.pages,
    );
  }
}
