import 'package:apple/core/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/food_details_screen.dart';

// ignore: must_be_immutable
class FoodWidget extends StatefulWidget {
  FoodWidget(
      {super.key,
      required this.id,
      required this.foodColor,
      required this.description,
      required this.imageUrl,
      required this.foodName,
      required this.price,
      required this.rate,
      required this.itsType,
      required this.weight,
      required this.quantity,
      required this.favorite,
      required this.cart});
  final String id;
  final String foodColor;
  final String description;
  final String imageUrl;
  final String foodName;
  final double price;
  final String rate;
  final String itsType;
  final String weight;
  int quantity;
  bool favorite;
  bool cart;

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  ValueNotifier<bool> isFav = ValueNotifier(false);

  ValueNotifier<bool> isClicked = ValueNotifier(false);

  ValueNotifier<int> itsQuan = ValueNotifier(0);
  @override
  void initState() {
    isFav.value = widget.favorite;
    isClicked.value = widget.cart;
    itsQuan.value = widget.quantity;
    super.initState();
  }

  final db = FirebaseFirestore.instance.collection("fruits");

  Future addCartList(String id) async {
    await FirebaseFirestore.instance.collection('cart').add({
      'id': widget.id,
      'quantity' : widget.quantity,
      'price' : widget.price,
    });
  }

  Future removeCartiteItem(String id) async {
    await FirebaseFirestore.instance
        .collection('cart')
        .where('id', isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
    db.doc(widget.id).update({'quantity': 0});
    db.doc(widget.id).update({'cart': false});
  }

  Future addFavoriteItem(String id) async {
    await FirebaseFirestore.instance.collection('favorite').add({
      'id': id,
    });
  }

  Future removeFavoriteItem(String id) async {
    await FirebaseFirestore.instance
        .collection('favorite')
        .where('id', isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }
  
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
                          isFav.value = !isFav.value;
                          if (isFav.value) {
                            addFavoriteItem(widget.id);
                          } else {
                            removeFavoriteItem(widget.id);
                          }
                          db.doc(widget.id).update({'favorite': isFav.value});
                        },
                        child: ValueListenableBuilder(
                          valueListenable: isFav,
                          builder: (context, value, child) => SvgPicture.asset(
                              value
                                  ? "assets/heartFill.svg"
                                  : "assets/heart.svg"),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsScreen(
                            id: widget.id,
                          ),
                        )),
                    child: Container(
                      width: .266.sw,
                      height: .128.sh,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                          int.parse("0xFF${widget.foodColor}"),
                        ).withOpacity(.2),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/healthy-food.png",
                        image: widget.imageUrl,
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/healthy-food.png"),
                        width: .24.sw,
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Text(
                    "\$${widget.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: greenColor,
                        fontFamily: "Poppins",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.foodName,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.weight,
                    style: TextStyle(
                        color: grayColor,
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
                db.doc(widget.id).update({'cart': isClicked.value});
                if (isClicked.value) {
                  addCartList(widget.id);
                } else {
                  removeCartiteItem(widget.id);
                }
              },
              child: ValueListenableBuilder(
                valueListenable: isClicked,
                builder: (context, value, child) => value
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (widget.quantity > 0) {
                                itsQuan.value--;

                                db
                                    .doc(widget.id)
                                    .update({'quantity': itsQuan.value});
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: greenColor,
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: itsQuan,
                            builder: (context, value, child) => SizedBox(
                              width: .145.sw,
                              child: Center(
                                  child: Text(
                                "${itsQuan.value}",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 16.sp),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              itsQuan.value++;

                              db
                                  .doc(widget.id)
                                  .update({'quantity': itsQuan.value});
                            },
                            child:  Icon(
                              Icons.add,
                              color: greenColor,
                            ),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/bag.svg",
                            width: .05.sw,
                            // ignore: deprecated_member_use
                            color: greenColor,
                          ),
                          8.horizontalSpace,
                          Text(
                            "Add to cart",
                            style: TextStyle(
                                color: const Color(0xff010101),
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
