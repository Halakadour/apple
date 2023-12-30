// ignore_for_file: unused_import

import 'package:apple/core/widgets/float_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/widgets/bottom_app_bar.dart';
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
      bottomNavigationBar: CustomBottomAppBar(pageIndex: 0),
      floatingActionButton: const MyFloatButton(),
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
                              foodType: myTabs[index][2]);
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
                            color: const Color(0xFF868889),
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
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : snapshot.connectionState == ConnectionState.done
                              ? snapshot.requireData.docs.isEmpty
                                  ? const Center(
                                      child: Text("No Data"),
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
                                            id: snapshot
                                                .requireData.docs[index].id,
                                            foodColor: snapshot.requireData
                                                .docs[index]['color'],
                                            description: snapshot.requireData
                                                .docs[index]['description'],
                                            foodName: snapshot.requireData
                                                .docs[index]['name'],
                                            imageUrl: snapshot.requireData
                                                .docs[index]['image'],
                                            itsType: snapshot.requireData
                                                .docs[index]['type'],
                                            price: snapshot.requireData
                                                .docs[index]['price'],
                                            rate: snapshot.requireData
                                                .docs[index]['rate'],
                                            weight: snapshot.requireData
                                                .docs[index]['weight'],
                                            quantity: snapshot.requireData
                                                .docs[index]['quantity'],
                                            favorite: snapshot.requireData
                                                .docs[index]['favorite'],
                                            cart: snapshot.requireData
                                                .docs[index]['cart'],
                                          ))
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
                      color: const Color.fromRGBO(117, 119, 121, 1),
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
