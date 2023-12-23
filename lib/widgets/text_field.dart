import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.iconPath, required this.hint});
  final String iconPath;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
                color: Color(0xff868889),
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: .45),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
