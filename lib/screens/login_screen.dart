import 'package:apple/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/signup.png",
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
            width: 1.sw,
            height: .55.sh,
            decoration: const BoxDecoration(
              color: Color(0xffF4F5F9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Welcome back !",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .75),
              ),
              const Text(
                "Sign in to your account",
                style: TextStyle(
                    color: Color(0xff868889),
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: .45),
              ),
              SizedBox(
                height: .03.sh,
              ),
              const MyTextField(
                  iconPath: "assets/message.svg", hint: "Email Address"),
              const MyTextField(
                  iconPath: "assets/locked.svg", hint: "password"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot password",
                        style: TextStyle(
                            color: Color(0xff407EC7),
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .45),
                      ))
                ],
              ),
              SizedBox(
                height: .02.sh,
              ),
              const MyButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account ?",
                    style: TextStyle(
                        color: Color(0xff868889),
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        letterSpacing: .45),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .45),
                      ))
                ],
              )
            ]),
          ),
        )
      ],
    ));
  }
}
