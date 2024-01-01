import 'package:apple/core/constants/colors.dart';
import 'package:apple/core/widgets/custom_button.dart';
import 'package:apple/home/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/widgets/food_tile.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({
    super.key,
  });
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGray,
        appBar: AppBar(
          toolbarHeight: 70,
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
            "Favorites",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: .54),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: FutureBuilder(
              future: db.collection('favorite').get(),
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : snapshot.connectionState == ConnectionState.done
                      ? snapshot.requireData.docs.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Column(
                                    children: [
                                      150.verticalSpace,
                                      SvgPicture.asset(
                                        "assets/favorite.svg",
                                        // ignore: deprecated_member_use
                                        color: greenColor,
                                        width: .25.sw,
                                      ),
                                      40.verticalSpace,
                                      Text(
                                        "Your favorite is empty !",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      20.verticalSpace,
                                      Text(
                                        "You will get a response within\na few minutes.",
                                        style: TextStyle(
                                            color: const Color(0xff868889),
                                            fontFamily: "Poppins",
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: .45.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  MyButton(
                                      name: "Start favoring",
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(),
                                            ));
                                      })
                                ])
                          : Expanded(
                              child: ListView.builder(
                              itemCount: snapshot.data?.size,
                              itemBuilder: (context, index) => FutureBuilder(
                                future: db
                                    .collection('fruits')
                                    .doc(snapshot.requireData.docs[index]['id'])
                                    .get(),
                                builder: (context, snapshot) => snapshot
                                            .connectionState ==
                                        ConnectionState.waiting
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : MyFoodTile(
                                        id: snapshot.requireData.id,
                                        foodColor: snapshot.requireData
                                            .data()!['color'],
                                        imageUrl: snapshot.requireData
                                            .data()!['image'],
                                        foodName: snapshot.requireData
                                            .data()!['name'],
                                        price: snapshot.requireData
                                            .data()!['price'],
                                        weight: snapshot.requireData
                                            .data()!['weight'],
                                        quantity: snapshot.requireData
                                            .data()!['quantity'],
                                        cart: snapshot.requireData
                                            .data()!['cart'],
                                        onPressed: (context) async {
                                          await FirebaseFirestore.instance
                                              .collection('favorite')
                                              .where('id',
                                                  isEqualTo:
                                                      snapshot.requireData.id)
                                              .get()
                                              .then((QuerySnapshot
                                                  querySnapshot) {
                                            querySnapshot.docs.forEach((doc) {
                                              doc.reference.delete();
                                            });
                                          });
                                          db
                                              .doc(snapshot.requireData.id)
                                              .update({'favorite': false});
                                        },
                                      ),
                              ),
                            ))
                      : const Center(child: Text("Failed")),
            )));
  }
}
