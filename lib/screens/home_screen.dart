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
        child: SvgPicture.asset(
          "assets/bag.svg",
          width: 20,
        ),
        backgroundColor: Color(0xff6CC51D),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: .1.sh,
                        height: .1.sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green[50], shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/vegatables.svg"),
                      ),
                      10.verticalSpace,
                      Text(
                        "Vegatables",
                        style: const TextStyle(
                            color: Color(0xff868889),
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: .1.sh,
                        height: .1.sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red[50], shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/fruits.svg"),
                      ),
                      10.verticalSpace,
                      Text(
                        "Fruits",
                        style: const TextStyle(
                            color: Color(0xff868889),
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: .1.sh,
                        height: .1.sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.orange[50], shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/beverages.svg"),
                      ),
                      10.verticalSpace,
                      Text(
                        "Beverages",
                        style: const TextStyle(
                            color: Color(0xff868889),
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: .1.sh,
                        height: .1.sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.purple[50], shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/grocery.svg"),
                      ),
                      10.verticalSpace,
                      Text(
                        "Grocery",
                        style: const TextStyle(
                            color: Color(0xff868889),
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: .1.sh,
                        height: .1.sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue[50], shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/oil.svg"),
                      ),
                      10.verticalSpace,
                      Text(
                        "Edible oil",
                        style: const TextStyle(
                            color: Color(0xff868889),
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: .1.sh,
                        height: .1.sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.pink[50], shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/houshold.svg"),
                      ),
                      10.verticalSpace,
                      Text(
                        "Houshold",
                        style: const TextStyle(
                            color: Color(0xff868889),
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: .1.sh,
                        height: .1.sw,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue[50], shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/babycare.svg"),
                      ),
                      10.verticalSpace,
                      Text(
                        "Babycare",
                        style: const TextStyle(
                            color: Color(0xff868889),
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
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
