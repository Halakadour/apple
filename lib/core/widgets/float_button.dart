import 'package:apple/cart/screens/cart_screen.dart';
import 'package:apple/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyFloatButton extends StatelessWidget {
  const MyFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ));
      },
      backgroundColor: greenColor,
      child: SvgPicture.asset(
        "assets/bag.svg",
        width: 20,
      ),
    );
  }
}
