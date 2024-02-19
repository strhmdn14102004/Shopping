import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/screens/navigation_screen.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.teal,
        // Add other light mode theme configurations as needed
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        // Add other dark mode theme configurations as needed
      ),
      themeMode: ThemeMode.system, // Use system theme (light/dark) settings
      home: NavigationScreen());
  }
}
