// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/food_widget.dart';

class GroceryScreen extends StatelessWidget {
  GroceryScreen({super.key, required this.groceryType});
  final db = FirebaseFirestore.instance;
  final String groceryType;
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
          groceryType,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: .54),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/filter.svg",
              width: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            10.verticalSpace,
            Expanded(
                child: FutureBuilder(
              future: db.collection("fruits").get(),
              builder: (context, snapshot) => snapshot.connectionState ==
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
                              itemCount: snapshot.requireData.docs.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: .7,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) => FoodWidget(
                                    id: snapshot.requireData.docs[index].id,
                                    foodColor: snapshot.requireData.docs[index]
                                        ['color'],
                                    description: snapshot
                                        .requireData.docs[index]['description'],
                                    foodName: snapshot.requireData.docs[index]
                                        ['name'],
                                    imageUrl: snapshot.requireData.docs[index]
                                        ['image'],
                                    itsType: snapshot.requireData.docs[index]
                                        ['type'],
                                    price: snapshot.requireData.docs[index]
                                        ['price'],
                                    rate: snapshot.requireData.docs[index]
                                        ['rate'],
                                    weight: snapshot.requireData.docs[index]
                                        ['weight'],
                                  ))
                      : const Center(child: Text("Failed")),
            ))
          ],
        ),
      ),
    );
  }
}
