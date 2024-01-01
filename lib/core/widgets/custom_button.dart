import 'package:apple/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.name, required this.onTap});
  final String name;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        height: .07.sh,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient:  LinearGradient(colors: [
              lightGreen,
              greenColor,
            ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Center(
            child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
