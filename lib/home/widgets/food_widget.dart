import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/food_details_screen.dart';

// ignore: must_be_immutable
class FoodWidget extends StatelessWidget {
  FoodWidget({
    super.key,
    required this.id,
    required this.foodColor,
    required this.description,
    required this.imageUrl,
    required this.foodName,
    required this.price,
    required this.rate,
    required this.itsType,
    required this.weight,
  });
  final String id;
  final String foodColor;
  final String description;
  final String imageUrl;
  final String foodName;
  final double price;
  final String rate;
  final String itsType;
  final String weight;

  ValueNotifier<bool> isFavorite = ValueNotifier(false);
  ValueNotifier<bool> isClicked = ValueNotifier(false);
  ValueNotifier<int> quantity = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          isFavorite.value = !isFavorite.value;
                        },
                        child: ValueListenableBuilder(
                          valueListenable: isFavorite,
                          builder: (context, value, child) {
                            return SvgPicture.asset(value
                                ? "assets/heartFill.svg"
                                : "assets/heart.svg");
                          },
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsScreen(
                              id: id,
                              quantity: quantity,
                              isFavorite: isFavorite),
                        )),
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          int.parse("0xFF$foodColor"),
                        ).withOpacity(.2),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/aocado.png",
                        image: imageUrl,
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/aocado.png"),
                        width: 100,
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style:  TextStyle(
                        color: Color(0xff6CC51D),
                        fontFamily: "Poppins",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    foodName,
                    style:  TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    weight,
                    style:  TextStyle(
                        color: Color(0xff868889),
                        fontFamily: "Poppins",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFEBEBEB),
              thickness: 1.2,
            ),
            GestureDetector(
              onTap: () {
                isClicked.value = !isClicked.value;
              },
              child: ValueListenableBuilder(
                valueListenable: isClicked,
                builder: (context, value, child) => value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (quantity.value > 0) {
                                quantity.value--;
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xff6CC51D),
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: quantity,
                            builder: (context, value, child) => SizedBox(
                              width: 60,
                              child: Center(
                                  child: Text(
                                "$value",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 16.sp),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              quantity.value++;
                            },
                            child: const Icon(
                              Icons.add,
                              color: Color(0xff6CC51D),
                            ),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/bag.svg",
                            width: 20,
                            // ignore: deprecated_member_use
                            color: const Color(0xff6CC51D),
                          ),
                          8.horizontalSpace,
                           Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Color(0xff010101),
                                fontFamily: "Poppins",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
              ),
            )
          ]),
    );
  }
}