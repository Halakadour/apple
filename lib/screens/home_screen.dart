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
    ["assets/oil.svg", Colors.blue, "Edible oil"],
    ["assets/houshold.svg", Colors.pink, "Houshold"],
    ["assets/babycare.svg", Colors.blue, "Babycare"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      bottomNavigationBar: BottomNavigationBar(
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
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff6CC51D),
        child: SvgPicture.asset(
          "assets/bag.svg",
          width: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: 1.sw,
                height: 3.sh,
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  children: [
                    80.verticalSpace,
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
                    10.verticalSpace,
                    Expanded(
                        child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: .7),
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.favorite_outline,
                                        color: Color(0xff868889)),
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment(0, 4),
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      clipBehavior: Clip.none,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow.shade100,
                                          shape: BoxShape.circle),
                                    ),
                                    Image.asset(
                                      "assets/aocado.png",
                                      width: 120,
                                    ),
                                  ],
                                ),
                                15.verticalSpace,
                                Text(
                                  "\$7.00",
                                  style: TextStyle(
                                      color: Color(0xff6CC51D),
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Avacoda",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "2.0 lbs",
                                  style: TextStyle(
                                      color: Color(0xff868889),
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xFFEBEBEB),
                            thickness: 1.2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/bag.svg",
                                width: 15,
                                color: Color(0xff6CC51D),
                              ),
                              8.horizontalSpace,
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                    color: Color(0xff010101),
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF4F5F9),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        "assets/search.svg",
                      ),
                    ),
                    hintText: "Search Keywords..",
                    hintStyle: const TextStyle(
                      color: Color(0xff868889),
                      fontFamily: "Poppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset("assets/filter.svg"),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            const BorderSide(color: Colors.transparent))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
