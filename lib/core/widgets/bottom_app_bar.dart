// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../favorite/screens/favorite_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../user/screens/user_screen.dart';



// ignore: must_be_immutable
class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({super.key, required this.pageIndex});
  int pageIndex;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.black,
        currentIndex: widget.pageIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserScreen(),
                  ));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  FavoriteScreen(),
                  ));
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home.svg",
                width: .05.sw,
                color: widget.pageIndex == 0 ? Colors.black : null,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/user.svg",
                width: .05.sw,
                color: widget.pageIndex == 1 ? Colors.black : null,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/favorite.svg",
                width: .05.sw,
                color: widget.pageIndex == 2 ? Colors.black : null,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "",
                width: .05.sw,
              ),
              label: ""),
        ]);
  }
}
