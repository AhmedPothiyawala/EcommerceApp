import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Custome_Functions/Custome_Strings/heading.dart';
import 'Custome_Functions/System_Orientation_and_SystemUIOverlayStyle/System_Orientation_and_SystemUIOverlayStyle_all_screen.dart';
import 'View/Dashborad.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  System_Orientation_and_SystemUIOverlayStyle_all_screen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: CustomHeading.application_name,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
