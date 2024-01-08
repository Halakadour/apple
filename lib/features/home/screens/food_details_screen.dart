import 'package:apple/core/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/custom_button.dart';

// ignore: must_be_immutable
class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  final db = FirebaseFirestore.instance;

  ValueNotifier<bool> isFav = ValueNotifier(false);

  ValueNotifier<int> itsQuan = ValueNotifier(0);
  void setValue() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('fruits')
        .doc(widget.id)
        .get();
    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        isFav.value = data['favorite'] as bool;
        itsQuan.value = data['quantity'] as int;
      }
    }
  }

  @override
  void initState() {
    setValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: db.collection('fruits').doc(widget.id).get(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: .4.sh,
                    child: Stack(
                      children: [
                        Container(
                          height: .3.sh,
                          decoration: BoxDecoration(
                              color: Color(
                                int.parse(
                                    "0xFF${snapshot.requireData.data()!['color']}"),
                              ).withOpacity(.2),
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(490))),
                        ),
                        Positioned(
                          left: .17.sw,
                          top: .07.sh,
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/aocado.png",
                            image: snapshot.requireData.data()!['image'],
                            imageErrorBuilder: (context, error, stackTrace) =>
                                Image.asset("assets/aocado.png"),
                            width: .6.sw,
                          ).animate().shake(),
                        ),
                        Positioned(
                          top: 30,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 30.sp,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: .6.sh,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 26),
                    decoration: BoxDecoration(
                        color: lightGray,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${snapshot.requireData.data()!['price']}",
                                style: TextStyle(
                                    color: greenColor,
                                    fontFamily: "Poppins",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ).animate().fade(),
                              GestureDetector(
                                onTap: () {
                                  isFav.value = !isFav.value;
                                  db
                                      .doc(widget.id)
                                      .update({'favorite': isFav.value});
                                },
                                child: ValueListenableBuilder(
                                  valueListenable: isFav,
                                  builder: (context, value, child) =>
                                      SvgPicture.asset(value
                                          ? "assets/heartFill.svg"
                                          : "assets/heart.svg"),
                                ),
                              ).animate().shake(),
                            ],
                          ),
                          Text(
                            snapshot.requireData.data()!['name'],
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600),
                          ).animate().fade(),
                          Text(
                            snapshot.requireData.data()!['weight'],
                            style: TextStyle(
                                color: const Color(0xff868889),
                                fontFamily: "Poppins",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ).animate().fade(),
                          10.verticalSpace,
                          Row(
                            children: [
                              Text(
                                snapshot.requireData.data()!['rate'],
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ).animate().fade().slideX(),
                              Icon(
                                Icons.star_rate_rounded,
                                color: starColor,
                              ).animate().slideX().fade(),
                              Icon(
                                Icons.star_rate_rounded,
                                color: starColor,
                              ).animate().slideX().fade(),
                              Icon(
                                Icons.star_rate_rounded,
                                color: starColor,
                              ).animate().slideX().fade(),
                              Icon(
                                Icons.star_rate_rounded,
                                color: starColor,
                              ).animate().slideX().fade(),
                              Icon(
                                Icons.star_half_rounded,
                                color: starColor,
                              ).animate().slideX().fade(),
                              Text(
                                "(89 reviews)",
                                style: TextStyle(
                                    color: grayColor,
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ).animate().fade().slideX(),
                            ],
                          ),
                          20.verticalSpace,
                          Text(
                            snapshot.requireData.data()!['description'],
                            style: TextStyle(
                                color: grayColor,
                                fontFamily: "Poppins",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                height: 2),
                          ).animate().slideY(begin: 2, end: 0),
                          15.verticalSpace,
                          Container(
                            height: .056.sh,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                      color: grayColor,
                                      fontFamily: "Poppins",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (itsQuan.value > 0) {
                                          itsQuan.value--;
                                          db
                                              .collection('fruits')
                                              .doc(widget.id)
                                              .update(
                                                  {'quantity': itsQuan.value});
                                        }
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: greenColor,
                                      ),
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable: itsQuan,
                                      builder: (context, value, child) =>
                                          Container(
                                        width: .14.sw,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: const BoxDecoration(
                                            border: Border.symmetric(
                                                vertical: BorderSide(
                                                    color: Color(0xffEBEBEB),
                                                    width: 1))),
                                        child: Center(
                                            child: Text(
                                          "$value",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 18.sp),
                                        )),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        itsQuan.value++;
                                        db
                                            .collection('fruits')
                                            .doc(widget.id)
                                            .update(
                                                {'quantity': itsQuan.value});
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: greenColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ).animate().slideY(begin: 2, end: 0),
                          ),
                          // 20.verticalSpace,
                          MyButton(
                            name: "Add to cart",
                            onTap: () async {
                              print('added');
                              await db
                                  .collection('fruits')
                                  .doc(widget.id)
                                  .update({'cart': true});
                              await db.collection('cart').add({
                                'id': widget.id,
                                'quantity': itsQuan.value,
                                'price': snapshot.requireData.data()!['price'],
                              });
                            },
                          ).animate().scale(),
                        ]),
                  )
                ]),
              ),
      ),
    );
  }
}
