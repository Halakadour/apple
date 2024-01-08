// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:apple/core/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_button.dart';
import '../../home/screens/home_screen.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isLoading = false;

  void signIn() async {
    if (!isLoading && formkey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.toString().trim(),
          password: passwordController.text,
        );
        setState(() {
          isLoading = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        if (e.code == 'weak-password') {
          displayMessage('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          displayMessage('The account already exists for that email.');
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        displayMessage(e.toString());
      }
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(message)),
    );
  }

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
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back !",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .75),
                      ),
                      Text(
                        "Sign in to your account",
                        style: TextStyle(
                            color: grayColor,
                            fontFamily: "Poppins",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: .45),
                      ),
                      SizedBox(
                        height: .03.sh,
                      ),
                      MyTextField(
                          controller: emailController,
                          validator: (email) {
                            if (email != null &&
                                RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                  caseSensitive: false,
                                ).hasMatch(email)) {
                              return null;
                            } else {
                              return "Add  valid email ";
                            }
                          },
                          iconPath: "assets/message.svg",
                          hint: "Email Address"),
                      MyTextField(
                          controller: passwordController,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return "Enter a vaild password";
                            }
                            return null;
                          },
                          iconPath: "assets/locked.svg",
                          hint: "password"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot password",
                                style: TextStyle(
                                    color: const Color(0xff407EC7),
                                    fontFamily: "Poppins",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: .45),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: .01.sh,
                      ),
                      MyButton(
                          name: isLoading ? "Loading" : "Login",
                          onTap: () async {
                            signIn();
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account ?",
                            style: TextStyle(
                                color: grayColor,
                                fontFamily: "Poppins",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                letterSpacing: .45),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: .45),
                              ))
                        ],
                      )
                    ]),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
