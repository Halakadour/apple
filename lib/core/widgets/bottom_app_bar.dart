// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({super.key, required this.pageIndex});
  ValueNotifier<int> pageIndex;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.pageIndex,
      builder: (context, pageValue, _) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Colors.black,
            currentIndex: pageValue,
            onTap: (value) {
              switch (value) {
                case 0:
                  {
                    if (pageValue == 0) {
                      break;
                    } else {
                      widget.pageIndex.value = 0;
                    }
                  }
                  break;
                case 1:
                  {
                    if (pageValue == 1) {
                      break;
                    } else {
                      widget.pageIndex.value = 1;
                    }
                  }
                  break;
                case 2:
                  {
                    if (pageValue == 2) {
                      break;
                    } else {
                      widget.pageIndex.value = 2;
                    }
                  }
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/home.svg",
                    width: .05.sw,
                    color: pageValue == 0 ? Colors.black : Colors.grey.shade400,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/user.svg",
                    width: .05.sw,
                    color: pageValue == 1 ? Colors.black : Colors.grey.shade400,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/favorite.svg",
                    width: .05.sw,
                    color: pageValue == 2 ? Colors.black : Colors.grey.shade400,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/favorite.svg",
                    width: .05.sw,
                  ),
                  label: ""),
            ]);
      },
    );
  }
}
