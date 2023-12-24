// ignore_for_file: unused_import

import 'package:apple/screens/categories_screen.dart';
import 'package:apple/widgets/bottom_app_bar.dart';
import 'package:apple/widgets/food_widget.dart';
import 'package:apple/widgets/tab_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      bottomNavigationBar: const CustomBottomAppBar(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
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
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF868889),
                            size: 24,
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
                        const Text(
                          "Featured products",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
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
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF868889),
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: FutureBuilder(
                          future: db.collection("fruits").get(),
                          builder: (context, snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting ? 
                         const Center(child: CircularProgressIndicator(),):
                         snapshot.connectionState == ConnectionState.done?
                         snapshot.requireData.docs.isEmpty ?
                         const Center(child: Text("No Data"),):
                          GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.requireData.docs.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: .7,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) => FoodWidget(
                                     foodColor: snapshot.requireData.docs[index]['color'],
                                     description: snapshot.requireData.docs[index]['description'],
                                     foodName: snapshot.requireData.docs[index]['name'],
                                     imageUrl: snapshot.requireData.docs[index]['image'],
                                     itsType: snapshot.requireData.docs[index]['type'],
                                     price: snapshot.requireData.docs[index]['price'],
                                     rate: snapshot.requireData.docs[index]['rate'],
                                     weight: snapshot.requireData.docs[index]['weight'],
                              )): 
                              const Center(child: Text("Failed")),
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
