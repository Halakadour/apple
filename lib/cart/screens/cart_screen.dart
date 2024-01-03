import 'package:apple/core/widgets/custom_button.dart';
import 'package:apple/core/widgets/food_tile.dart';
import 'package:apple/home/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/colors.dart';

class CartScreen extends StatelessWidget {
  CartScreen({
    super.key,
  });
  final db = FirebaseFirestore.instance;
  double total = 0;
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
            "Shopping Cart",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: .54),
          ),
        ),
        body: FutureBuilder(
          future: db.collection('cart').get(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : snapshot.connectionState == ConnectionState.done
                  ? snapshot.requireData.docs.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    150.verticalSpace,
                                    SvgPicture.asset(
                                      "assets/bag.svg",
                                      // ignore: deprecated_member_use
                                      color: greenColor,
                                      width: .25.sw,
                                    ),
                                    40.verticalSpace,
                                    Text(
                                      "Your cart is empty !",
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
                                          color: grayColor,
                                          fontFamily: "Poppins",
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: .45.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                MyButton(
                                    name: "Start shopping",
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ));
                                    })
                              ]),
                        )
                      : Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Expanded(
                                child: ListView.builder(
                              itemCount: snapshot.data?.size,
                              itemBuilder: (context, index) => FutureBuilder(
                                  future: db
                                      .collection('fruits')
                                      .doc(snapshot.requireData.docs[index]
                                          ['id'])
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      total = total +
                                          snapshot.requireData
                                                  .data()!['price'] *
                                              snapshot.requireData
                                                  .data()!['quantity'];
                                      return MyFoodTile(
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
                                              .collection('cart')
                                              .where('id',
                                                  isEqualTo:
                                                      snapshot.requireData.id)
                                              .get()
                                              .then((QuerySnapshot
                                                  querySnapshot) {
                                            for (var doc
                                                in querySnapshot.docs) {
                                              doc.reference.delete();
                                            }
                                          });
                                          db
                                              .doc(snapshot.requireData.id)
                                              .update({'quantity': 0});
                                          db
                                              .doc(snapshot.requireData.id)
                                              .update({'cart': false});
                                        },
                                      );
                                    }
                                  }),
                            )),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 1.sw,
                              height: .2.sh,
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Column(children: [
                                  10.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 170),
                                    child: Divider(
                                      color: Colors.grey[300],
                                      thickness: 1.5,
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Builder(builder: (context) {
                                        return Text(
                                          "\$$total",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        );
                                      })
                                    ],
                                  ),
                                  20.verticalSpace,
                                  MyButton(name: "Checkout", onTap: () {})
                                ]),
                              ),
                            ),
                          )
                        ])
                  : const Center(child: Text("Failed")),
        ));
  }
}
