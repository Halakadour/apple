import 'package:apple/core/widgets/float_button.dart';
import 'package:apple/user/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/bottom_app_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F9),
      bottomNavigationBar: CustomBottomAppBar(pageIndex: 1),
      floatingActionButton: const MyFloatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Column(children: [
        Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: .2.sh,
            child: Row(
              children: [
                Container(
                    width: .2.sw,
                    height: .2.sh,
                    margin: const EdgeInsets.only(top: 30),
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/portfolio.png",
                      fit: BoxFit.contain,
                    )),
                20.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    40.verticalSpace,
                    Text(
                      "Olivia Austin",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.5),
                    ),
                    Text(
                      "oliviaaustin@gmail.com",
                      style: TextStyle(
                          color: const Color(0xff868889),
                          fontFamily: "Poppins",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5),
                    )
                  ],
                )
              ],
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: .65.sh,
          child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyListTile(imagePath: "assets/person.svg", title: "About me"),
            MyListTile(
              imagePath: "assets/box.svg",
              title: "My Orders",
            ),
            MyListTile(
              imagePath: "assets/favorite.svg",
              title: "My Favorites",
            ),
            MyListTile(
              imagePath: "assets/location.svg",
              title: "My Address",
            ),
            MyListTile(
              imagePath: "assets/card.svg",
              title: "Credit Cards",
            ),
            MyListTile(
              imagePath: "assets/dollar.svg",
              title: "Transactions",
            ),
            MyListTile(
              imagePath: "assets/bill.svg",
              title: "Notifications",
            ),
            MyListTile(imagePath: "assets/arrow.svg", title: "Sign out")
          ]),
        )
      ]),
    );
  }
}
