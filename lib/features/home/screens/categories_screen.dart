import 'package:apple/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/tab_bar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.itemList});
  final List itemList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGray,
      appBar: AppBar(
        toolbarHeight: .08.sh,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Categories",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: .54),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/filter.svg",
              width: .05.sw,
              // ignore: deprecated_member_use
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            10.verticalSpace,
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1.1),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: TabBarItems(
                      imagePath: itemList[index][0],
                      color: itemList[index][1],
                      foodType: itemList[index][2]),
                ).animate().scale(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
