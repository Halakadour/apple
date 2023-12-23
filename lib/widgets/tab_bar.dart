// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBarItems extends StatelessWidget {
  const TabBarItems(
      {super.key,
      required this.imagePath,
      required this.color,
      required this.foodType});

  final String imagePath;
  final color;
  final String foodType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: .1.sh,
          height: .1.sw,
          padding: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(color: Colors.green[50], shape: BoxShape.circle),
          child: SvgPicture.asset(imagePath),
        ),
        10.verticalSpace,
        Text(
          foodType,
          style: TextStyle(
              color: color,
              fontFamily: "Poppins",
              fontSize: 10,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
