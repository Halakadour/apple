// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:apple/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/screens/signup_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ValueNotifier<int> index = ValueNotifier(1);
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          SizedBox(
            height: .1.sh,
          ),
          ValueListenableBuilder(
            valueListenable: index,
            builder: (context, value, child) => SizedBox(
              height: .8.sh,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) {
                  index.value = page + 1;
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SvgPicture.asset(
                        "assets/$value.svg",
                        height: .5.sh,
                      ).animate().slideX(),
                      SizedBox(
                        height: .1.sh,
                      ),
                      Text(
                        value == 1
                            ? "Enjoy Quality Food"
                            : value == 2
                                ? "Fast Delivery"
                                : "Buy Grocery",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: .75),
                        textAlign: TextAlign.center,
                      ).animate().fade(),
                      SizedBox(
                        height: .02.sh,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: grayColor,
                            fontFamily: "Poppins",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .45),
                      ).animate().fade(),
                      SizedBox(
                        height: .06.sh,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                child:  Text(
                  "Skip",
                  style: TextStyle(
                    color:const Color(0xffC4C4C4),
                    fontFamily: "Poppins",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ValueListenableBuilder(
                  valueListenable: index,
                  builder: (context, value, child) => Container(
                    height: .02.sh,
                    width: .02.sw,
                    decoration: BoxDecoration(
                        color:
                            value == 1 ? greenColor : const Color(0xffDCDCDC),
                        shape: BoxShape.circle),
                  ),
                ),
                SizedBox(
                  width: .01.sw,
                ),
                ValueListenableBuilder(
                  valueListenable: index,
                  builder: (context, value, child) => Container(
                    height: .02.sh,
                    width: .02.sw,
                    decoration: BoxDecoration(
                        color:
                            value == 2 ? greenColor : const Color(0xffDCDCDC),
                        shape: BoxShape.circle),
                  ),
                ),
                SizedBox(
                  width: .01.sw,
                ),
                ValueListenableBuilder(
                  valueListenable: index,
                  builder: (context, value, child) => Container(
                    height: .02.sh,
                    width: .02.sw,
                    decoration: BoxDecoration(
                        color:
                            value == 3 ? greenColor : const Color(0xffDCDCDC),
                        shape: BoxShape.circle),
                  ),
                ),
              ]),
              TextButton(
                  onPressed: () async {
                    (await SharedPreferences.getInstance()).clear();
                    if (index.value < 3) {
                      _pageController.animateToPage(
                        index.value,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.ease,
                      );
                      index.value++;
                    } else {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('firstTime', true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    }
                  },
                  child: ValueListenableBuilder(
                    valueListenable: index,
                    builder: (context, value, child) => Text(
                      value == 3 ? "Start" : "Next",
                      style: TextStyle(
                        color: greenColor,
                        fontFamily: "Poppins",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
