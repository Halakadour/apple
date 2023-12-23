// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //@override
  // void didChangeDependencies() {
  //   Future.delayed(const Duration(seconds: 4), () async {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final isFirst = prefs.getBool('firstTime');
  //     if (isFirst != null) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const SignUpScreen(),
  //         ),
  //       );
  //     } else {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => DetailsScreen(),
  //         ),
  //       );
  //     }
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset(
      "assets/splash.png",
      width: .4.sw,
    )));
  }
}
