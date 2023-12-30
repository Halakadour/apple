import 'package:apple/core/widgets/custom_button.dart';
import 'package:apple/home/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  CartScreen({
    super.key,
  });
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF4F5F9),
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
        body: Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: FutureBuilder(
              future: db.collection('cart').get(),
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
                                        "assets/bag.svg",
                                        // ignore: deprecated_member_use
                                        color: const Color(0xff6CC51D),
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
                                      name: "Start shopping",
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
                                    : Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        padding: const EdgeInsets.all(10),
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(
                                                      int.parse(
                                                          "0xFF${snapshot.requireData.data()!['color']}"),
                                                    ).withOpacity(.2),
                                                  ),
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                    placeholder:
                                                        "assets/aocado.png",
                                                    image: snapshot.requireData
                                                        .data()!['image'],
                                                    imageErrorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                            "assets/aocado.png"),
                                                    width: 70,
                                                  ),
                                                ),
                                                10.horizontalSpace,
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "\$${snapshot.requireData.data()!['price']}x${snapshot.requireData.data()!['quantity']}",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xff28B446),
                                                          fontFamily: "Poppins",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      snapshot.requireData
                                                          .data()!['name'],
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      snapshot.requireData
                                                          .data()!['weight'],
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xff868889),
                                                          fontFamily: "Poppins",
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    db
                                                        .doc(snapshot
                                                            .requireData.id)
                                                        .update({
                                                      'quantity': snapshot
                                                                  .requireData
                                                                  .data()![
                                                              'quantity'] +
                                                          1
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Color(0xff6CC51D),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: 60,
                                                    child: Center(
                                                        child: Text(
                                                      "${snapshot.requireData.data()!['quantity']}",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 16.sp),
                                                    ))),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (snapshot.requireData
                                                            .data()!['quantity']
                                                            .value >
                                                        0) {
                                                      db
                                                          .doc(snapshot
                                                              .requireData.id)
                                                          .update({
                                                        'quantity': snapshot
                                                                    .requireData
                                                                    .data()![
                                                                'quantity'] -
                                                            1
                                                      });
                                                    }
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Color(0xff6CC51D),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                            ))
                      : const Center(child: Text("Failed")),
            )));
  }
}
