import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seek_assesment/views/login_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Seek Assesment',
      theme: ThemeData(
        fontFamily: "Montserrat",
        primaryColor: Colors.black,
      ),
      home: LoginScreen(),
    );
  }
}
