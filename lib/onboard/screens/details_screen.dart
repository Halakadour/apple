// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    _pageController = PageController(initialPage: index.value);
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
                      ),
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
                      ),
                      SizedBox(
                        height: .02.sh,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff868889),
                            fontFamily: "Poppins",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .45),
                      ),
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
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xffC4C4C4),
                    fontFamily: "Poppins",
                    fontSize: 15,
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
                        color: value == 1
                            ? const Color(0xff6CC51D)
                            : const Color(0xffDCDCDC),
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
                        color: value == 2
                            ? const Color(0xff6CC51D)
                            : const Color(0xffDCDCDC),
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
                        color: value == 3
                            ? const Color(0xff6CC51D)
                            : const Color(0xffDCDCDC),
                        shape: BoxShape.circle),
                  ),
                ),
              ]),
              TextButton(
                  onPressed: () {
                    if (index.value < 3) {
                      index.value++;
                      _pageController.animateToPage(
                        index.value,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.ease,
                      );
                    } else {
                      // final SharedPreferences prefs = await SharedPreferences.getInstance();
                      // await prefs.setBool('firstTime', true);
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
                      style:  TextStyle(
                        color: Color(0xff6CC51D),
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
