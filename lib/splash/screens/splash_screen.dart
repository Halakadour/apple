// ignore_for_file: use_build_context_synchronously


import 'package:apple/features/auth/screens/auth_screen.dart';
import 'package:apple/features/onboard/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(seconds: 2), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final isFirst = prefs.getBool('firstTime');
      if (isFirst != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailsScreen(),
          ),
        );
      }
    });
    super.didChangeDependencies();
  }

  // @override
  // void didChangeDependencies() {
  //   Future.delayed(
  //     // ignore: prefer_const_constructors
  //     Duration(seconds: 3),
  //     () => Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const DetailsScreen(),
  //         )),
  //   );
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/splash.png",
          width: .4.sw,
        )
            .animate()
            .scale(delay: Durations.medium4)
            .fade(delay: Durations.long1),
      ),
    );
  }
}
