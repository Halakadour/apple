import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/home.svg",
                  width: 20,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/user.svg",
                  width: 20,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/favorite.svg",
                  width: 20,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "",
                  width: 20,
                ),
                label: ""),
          ]);
  }
}