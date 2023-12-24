import 'package:apple/screens/login_screen.dart';
import 'package:apple/widgets/custom_button.dart';
import 'package:apple/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            height: .6.sh,
            decoration: const BoxDecoration(
              color: Color(0xffF4F5F9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Create account",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .75),
              ),
              const Text(
                "Quickly create account",
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
              const MyTextField(iconPath: "assets/user.svg", hint: "Full Name"),
              const MyTextField(
                  iconPath: "assets/message.svg", hint: "Email Address"),
              const MyTextField(
                  iconPath: "assets/locked.svg", hint: "password"),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: const Text(
                        "Login",
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
