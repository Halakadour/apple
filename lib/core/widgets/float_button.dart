import 'package:apple/cart/screens/cart_screen.dart';
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
      backgroundColor: const Color(0xff6CC51D),
      child: SvgPicture.asset(
        "assets/bag.svg",
        width: 20,
      ),
    );
  }
}
