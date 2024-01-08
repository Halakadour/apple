// ignore_for_file: unused_import

import 'package:apple/core/constants/colors.dart';
import 'package:apple/core/widgets/bottom_app_bar.dart';
import 'package:apple/core/widgets/float_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/food_widget.dart';
import '../widgets/tab_bar.dart';
import 'categories_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final db = FirebaseFirestore.instance;
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
                    Image.asset("assets/homey.png")
                        .animate()
                        .fadeIn(
                          begin: .2,
                        )
                        .scale(
                            begin: const Offset(.8, .8),
                            end: const Offset(1, 1),
                            delay: Durations.short2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Categories(itemList: myTabs),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: const Color(0xFF868889),
                            size: 24.sp,
                          ),
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
                                  foodType: myTabs[index][2])
                              .animate()
                              .scale(curve: Curves.bounceInOut)
                              .slideX();
                        },
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Featured products",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Categories(itemList: myTabs),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: grayColor,
                            size: 24.sp,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: FutureBuilder(
                      future: db.collection("fruits").get(),
                      builder: (context, snapshot) => snapshot
                                  .connectionState ==
                              ConnectionState.waiting
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: .65,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) => ConstrainedBox(
                                    constraints: const BoxConstraints(
                                        minHeight: 100, minWidth: 100),
                                    child: Animate(
                                      effects: [
                                        ShimmerEffect(
                                            duration: Durations.extralong4,
                                            color: Colors.grey.shade200,
                                            angle: .7),
                                        ShimmerEffect(
                                            duration: Durations.extralong4,
                                            delay: Durations.extralong4,
                                            color: Colors.grey.shade200,
                                            angle: .7),
                                        ShimmerEffect(
                                            duration: Durations.extralong4,
                                            delay: Durations.extralong4 * 2,
                                            color: Colors.grey.shade200,
                                            angle: .7),
                                        ShimmerEffect(
                                            duration: Durations.extralong4,
                                            delay: Durations.extralong4 * 3,
                                            color: Colors.grey.shade200,
                                            angle: .7),
                                        ShimmerEffect(
                                            duration: Durations.extralong4,
                                            delay: Durations.extralong4 * 4,
                                            color: Colors.grey.shade200,
                                            angle: .7),
                                        ShimmerEffect(
                                            duration: Durations.extralong4,
                                            delay: Durations.extralong4 * 5,
                                            color: Colors.grey.shade200,
                                            angle: .7),
                                        ShimmerEffect(
                                            duration: Durations.extralong4,
                                            delay: Durations.extralong4 * 6,
                                            color: Colors.grey.shade200,
                                            angle: .7),
                                      ],
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ))
                          : snapshot.connectionState == ConnectionState.done
                              ? snapshot.requireData.docs.isEmpty
                                  ? const Center(
                                      child: Text('There Is No Data'),
                                    )
                                  : GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          snapshot.requireData.docs.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: .65,
                                              crossAxisSpacing: 8),
                                      itemBuilder: (context, index) =>
                                          FoodWidget(
                                        id: snapshot.requireData.docs[index].id,
                                        foodColor: snapshot
                                            .requireData.docs[index]['color'],
                                        description: snapshot.requireData
                                            .docs[index]['description'],
                                        foodName: snapshot
                                            .requireData.docs[index]['name'],
                                        imageUrl: snapshot
                                            .requireData.docs[index]['image'],
                                        itsType: snapshot
                                            .requireData.docs[index]['type'],
                                        price: snapshot.requireData.docs[index]
                                            ['price'],
                                        rate: snapshot.requireData.docs[index]
                                            ['rate'],
                                        weight: snapshot.requireData.docs[index]
                                            ['weight'],
                                        quantity: snapshot.requireData
                                            .docs[index]['quantity'],
                                        favorite: snapshot.requireData
                                            .docs[index]['favorite'],
                                        cart: snapshot.requireData.docs[index]
                                            ['cart'],
                                      )
                                              .animate(onComplete: (c) async {
                                                c.stop();
                                                await c.forward();
                                              })
                                              .slideX()
                                              .fade(),
                                    )
                              : const Center(child: Text("Failed")),
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
                    fillColor: const Color(0xFFF0F0F1),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        "assets/search.svg",
                      ),
                    ),
                    hintText: "Search Keywords..",
                    hintStyle: TextStyle(
                      color: const Color(0xFF757779),
                      fontFamily: "Poppins",
                      fontSize: 13.sp,
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
