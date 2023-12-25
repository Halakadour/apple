// ignore_for_file: unused_import

import 'package:apple/screens/details_screen.dart';
import 'package:apple/screens/food_details_screen.dart';
import 'package:apple/screens/home_screen.dart';
import 'package:apple/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) =>
          const MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
