import 'package:apple/core/widgets/custom_button.dart';
import 'package:apple/core/widgets/food_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/colors.dart';
import '../../home/screens/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final db = FirebaseFirestore.instance;

  ValueNotifier<num> total = ValueNotifier(0);

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
                                    ).animate().shake(),
                                    40.verticalSpace,
                                    Text(
                                      "Your cart is empty !",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ).animate().fade(),
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
                                    ).animate().fade(),
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
                                    }).animate().scale()
                              ]),
                        )
                      : Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data?.size,
                                    itemBuilder: (context, index) {
                                      total.value = 0;

                                      return FutureBuilder(
                                          future: db
                                              .collection('fruits')
                                              .doc(snapshot.requireData
                                                  .docs[index]['id'])
                                              .get(),
                                          builder: (context, innerSnapshot) {
                                            if (innerSnapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return MyFoodTile(
                                                id: '',
                                                foodColor: 'ffffff',
                                                imageUrl: 'image',
                                                foodName: 'loading',
                                                price: 200,
                                                weight: 'loading',
                                                quantity: 2,
                                                cart: false,
                                                onPressed: (context) async {},
                                              ).animate(effects: [
                                                ShimmerEffect(
                                                    duration:
                                                        Durations.extralong4,
                                                    color: Colors.grey.shade200,
                                                    angle: .7),
                                                ShimmerEffect(
                                                    duration:
                                                        Durations.extralong4,
                                                    delay: Durations.extralong4,
                                                    color: Colors.grey.shade200,
                                                    angle: .7),
                                                ShimmerEffect(
                                                    duration:
                                                        Durations.extralong4,
                                                    delay:
                                                        Durations.extralong4 *
                                                            2,
                                                    color: Colors.grey.shade200,
                                                    angle: .7),
                                                ShimmerEffect(
                                                    duration:
                                                        Durations.extralong4,
                                                    delay:
                                                        Durations.extralong4 *
                                                            3,
                                                    color: Colors.grey.shade200,
                                                    angle: .7),
                                                ShimmerEffect(
                                                    duration:
                                                        Durations.extralong4,
                                                    delay:
                                                        Durations.extralong4 *
                                                            4,
                                                    color: Colors.grey.shade200,
                                                    angle: .7),
                                                ShimmerEffect(
                                                    duration:
                                                        Durations.extralong4,
                                                    delay:
                                                        Durations.extralong4 *
                                                            5,
                                                    color: Colors.grey.shade200,
                                                    angle: .7),
                                                ShimmerEffect(
                                                    duration:
                                                        Durations.extralong4,
                                                    delay:
                                                        Durations.extralong4 *
                                                            6,
                                                    color: Colors.grey.shade200,
                                                    angle: .7),
                                              ]);
                                            } else {
                                              total.value += (innerSnapshot
                                                      .requireData
                                                      .data()!['price'] *
                                                  innerSnapshot.requireData
                                                      .data()!['quantity']);

                                              return MyFoodTile(
                                                id: innerSnapshot
                                                    .requireData.id,
                                                foodColor: innerSnapshot
                                                    .requireData
                                                    .data()!['color'],
                                                imageUrl: innerSnapshot
                                                    .requireData
                                                    .data()!['image'],
                                                foodName: innerSnapshot
                                                    .requireData
                                                    .data()!['name'],
                                                price: innerSnapshot.requireData
                                                    .data()!['price'],
                                                weight: innerSnapshot
                                                    .requireData
                                                    .data()!['weight'],
                                                quantity: innerSnapshot
                                                    .requireData
                                                    .data()!['quantity'],
                                                cart: innerSnapshot.requireData
                                                    .data()!['cart'],
                                                onPressed: (context) async {
                                                  await db
                                                      .collection('cart')
                                                      .where('id',
                                                          isEqualTo:
                                                              innerSnapshot
                                                                  .requireData
                                                                  .id)
                                                      .get()
                                                      .then((QuerySnapshot
                                                          querySnapshot) {
                                                    for (var doc
                                                        in querySnapshot.docs) {
                                                      doc.reference.delete();
                                                    }
                                                  });
                                                  await db
                                                      .collection('fruits')
                                                      .doc(snapshot.requireData
                                                          .docs[index]['id'])
                                                      .update({
                                                    'quantity': 0,
                                                    'cart': false,
                                                  });
                                                },
                                              ).animate().flip();
                                            }
                                          });
                                    })),
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
                                      ValueListenableBuilder(
                                          valueListenable: total,
                                          builder: (context, value, _) {
                                            return Text(
                                              "\$$value",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            );
                                          })
                                    ],
                                  ).animate().fade(),
                                  20.verticalSpace,
                                  MyButton(name: "Checkout", onTap: () {})
                                      .animate()
                                      .scale()
                                ]),
                              ),
                            ),
                          )
                        ])
                  : const Center(child: Text("Failed")),
        ));
  }
}
