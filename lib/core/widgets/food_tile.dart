import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFoodTile extends StatefulWidget {
  MyFoodTile(
      {Key? key,
      required this.id,
      required this.foodColor,
      required this.imageUrl,
      required this.foodName,
      required this.price,
      required this.weight,
      required this.quantity,
      required this.cart})
      : super(key: key);
  final String id;
  final String foodColor;
  final String imageUrl;
  final String foodName;
  final double price;
  final String weight;
  int quantity;
  bool cart;

  @override
  State<MyFoodTile> createState() => _MyFoodTileState();
}

class _MyFoodTileState extends State<MyFoodTile> {
  final db = FirebaseFirestore.instance;

  ValueNotifier<int> itsQuan = ValueNotifier(0);

  @override
  void initState() {
    itsQuan.value = widget.quantity;
    super.initState();
  }

  Future removeCartiteItem(String id) async {
    await FirebaseFirestore.instance.collection('cart').doc(id).delete();
    db.doc(widget.id).update({'quantity': 0});
    db.doc(widget.id).update({'cart': false});
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            removeCartiteItem(widget.id);
          },
          backgroundColor: Color(0xffEF574B),
          icon: Icons.delete,
        )
      ]),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(
                      int.parse("0xFF${widget.foodColor}"),
                    ).withOpacity(.2),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/aocado.png",
                    image: widget.imageUrl,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/aocado.png"),
                    width: 70,
                  ),
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${widget.price}x${widget.quantity}",
                      style: TextStyle(
                          color: const Color(0xff28B446),
                          fontFamily: "Poppins",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.foodName,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.weight,
                      style: TextStyle(
                          color: const Color(0xff868889),
                          fontFamily: "Poppins",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    itsQuan.value++;
                    db.doc(widget.id).update({'quantity': itsQuan.value});
                  },
                  child: const Icon(
                    Icons.add,
                    color: Color(0xff6CC51D),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: itsQuan,
                  builder: (context, value, child) => SizedBox(
                      width: 60,
                      child: Center(
                          child: Text(
                        "${value}",
                        style:
                            TextStyle(fontFamily: "Poppins", fontSize: 16.sp),
                      ))),
                ),
                GestureDetector(
                  onTap: () {
                    if (itsQuan.value > 0) {
                      itsQuan.value--;
                      db.doc(widget.id).update({'quantity': itsQuan.value});
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
    );
  }
}
