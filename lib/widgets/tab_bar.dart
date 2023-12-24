// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/grocery_screen.dart';

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
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GroceryScreen(groceryType: foodType),)),
      child: Column(
        children: [
          Container(
            width: .11.sh,
            height: .11.sw,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color[50], shape: BoxShape.circle),
            child: SvgPicture.asset(imagePath),
          ),
          10.verticalSpace,
          Text(
            foodType,
            style: const TextStyle(
                color: Color(0xff868889),
                fontFamily: "Poppins",
                fontSize: 10,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
