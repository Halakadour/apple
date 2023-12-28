import 'package:apple/user/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/widgets/bottom_app_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F9),
      bottomNavigationBar: CustomBottomAppBar(pageIndex: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff6CC51D),
        child: SvgPicture.asset(
          "assets/bag.svg",
          width: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Column(children: [
        Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: .2.sh,
            child: Row(
              children: [
                Container(
                    width: .2.sw,
                    height: .2.sh,
                    margin: EdgeInsets.only(top: 30),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(shape: BoxShape.circle),
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
                          color: Color(0xff868889),
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: .65.sh,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            MyListTile(ImagePath: "assets/person.svg", title: "About me"),
            MyListTile(
              ImagePath: "assets/box.svg",
              title: "My Orders",
            ),
            MyListTile(
              ImagePath: "assets/favorite.svg",
              title: "My Favorites",
            ),
            MyListTile(
              ImagePath: "assets/location.svg",
              title: "My Address",
            ),
            MyListTile(
              ImagePath: "assets/card.svg",
              title: "Credit Cards",
            ),
            MyListTile(
              ImagePath: "assets/dollar.svg",
              title: "Transactions",
            ),
            MyListTile(
              ImagePath: "assets/bill.svg",
              title: "Notifications",
            ),
            MyListTile(ImagePath: "assets/arrow.svg", title: "Sign out")
          ]),
        )
      ]),
    );
  }
}
