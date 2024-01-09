import 'package:apple/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/cart/screens/cart_screen.dart';

class MyFloatButton extends StatelessWidget {
  const MyFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ));
      },
      backgroundColor: greenColor,
      child: SvgPicture.asset(
        "assets/bag.svg",
        width: .05.sw,
      ),
    );
  }
}
