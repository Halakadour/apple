import 'package:apple/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List myTabs = [
    ["assets/vegatables.svg", Colors.green, "Vegatables"],
    ["assets/fruits.svg", Colors.red, "Fruits"],
    ["assets/beverages.svg", Colors.orange, "beverages"],
    ["assets/grocery.svg", Colors.purple, "Grocery"],
    ["assets/oil.svg", Colors.cyanAccent, "Edible oil"],
    ["assets/houshold.svg", Colors.pink, "Houshold"],
    ["assets/babycare.svg", Colors.blue, "Babycare"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
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
            label: "")
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff6CC51D),
        child: SvgPicture.asset(
          "assets/bag.svg",
          width: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            35.verticalSpace,
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF4F5F9),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      "assets/search.svg",
                    ),
                  ),
                  hintText: "Search Keywords..",
                  hintStyle: const TextStyle(
                    color: Color(0xff868889),
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset("assets/filter.svg"),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.transparent))),
            ),
            10.verticalSpace,
            Image.asset("assets/homey.png"),
            10.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF868889),
                  size: 24,
                )
              ],
            ),
            15.verticalSpace,
            SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: myTabs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TabBarItems(
                      imagePath: myTabs[index][0],
                      color: myTabs[index][1],
                      foodType: myTabs[index][2]);
                },
              ),
            ),
            25.verticalSpace,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured products",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF868889),
                  size: 24,
                )
              ],
            ),

            // Container(
            //   color: Colors.red,
            //   height: .06.sh,
            //   width: 1.5.sw,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: myTabs.length,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) {
            //       return TabBarItems(
            //           imagePath: myTabs[index][0],
            //           color: myTabs[index][1],
            //           foodType: myTabs[index][2]);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
