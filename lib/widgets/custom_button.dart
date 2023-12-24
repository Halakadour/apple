import 'package:apple/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          )),
      child: Container(
        width: 1.sw,
        height: .07.sh,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient: const LinearGradient(colors: [
              Color(0xffAEDC81),
              Color(0xff6CC51D),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: const Center(
            child: Text(
          "Signup",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
