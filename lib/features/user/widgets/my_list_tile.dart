import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.imagePath, required this.title});
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        imagePath,
        // ignore: deprecated_member_use
        color: const Color(0xff28B446),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: .36),
      ),
      trailing: title == "Sign out"
          ? null
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff868889),
              )),
    );
  }
}
