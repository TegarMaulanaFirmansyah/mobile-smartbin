import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin/pages/auth/sign-in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/sign-in',
      getPages: [GetPage(name: '/sign-in', page: () => const SignInPage())],
    );
  }
}
