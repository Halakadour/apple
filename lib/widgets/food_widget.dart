import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget(
      {super.key,
      required this.foodColor,
      required this.description,
      required this.imageUrl,
      required this.foodName,
      required this.price,
      required this.rate,
      required this.itsType,
      required this.weight});
      
  final String foodColor;
  final String description;
  final String imageUrl;
  final String foodName;
  final String price;
  final String rate;
  final String itsType;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [SvgPicture.asset("assets/heart.svg")],
              ),
              Stack(
                alignment: const Alignment(0, 4),
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade100, shape: BoxShape.circle),
                  ),
                  FadeInImage.assetNetwork(
                    placeholder: "assets/aocado.png",
                    image: imageUrl,
                    imageErrorBuilder: (context, error, stackTrace) =>Image.asset("assets/aocado.png"),
                    width: 120,
                  ),
                ],
              ),
              15.verticalSpace,
               Text(
                price,
                style: const TextStyle(
                    color: Color(0xff6CC51D),
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
               Text(
                foodName,
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
               Text(
                weight,
                style: const TextStyle(
                    color: Color(0xff868889),
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFEBEBEB),
          thickness: 1.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/bag.svg",
              width: 15,
              // ignore: deprecated_member_use
              color: const Color(0xff6CC51D),
            ),
            8.horizontalSpace,
            const Text(
              "Add to cart",
              style: TextStyle(
                  color: Color(0xff010101),
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ]),
    );
  }
}
