// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:apple/core/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_button.dart';
import '../../home/screens/home_screen.dart';
import '../widgets/text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isLoading = false;

  void signUp() async {
    if (!isLoading && formkey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.toString().trim(),
          password: passwordController.text,
        );
        setState(() {
          isLoading = false;
        });
        addUserDetails(nameController.text.trim(), emailController.text.trim());
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

  Future addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
    });
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
            height: .6.sh,
            decoration: const BoxDecoration(
              color: Color(0xffF4F5F9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Create account",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .75),
              ),
              Text(
                "Quickly create account",
                style: TextStyle(
                    color: grayColor,
                    fontFamily: "Poppins",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: .45),
              ),
              Form(
                key: formkey,
                child: SizedBox(
                  height: .03.sh,
                ),
              ),
              MyTextField(
                  controller: nameController,
                  validator: (name) {
                    if (!(name != null && name.length >= 3)) {
                      return 'Enter your Name';
                    }
                    return null;
                  },
                  iconPath: "assets/user.svg",
                  hint: "Full Name"),
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
              SizedBox(
                height: .02.sh,
              ),
              MyButton(
                  name: isLoading ? "Loading" : "Signup",
                  onTap: () async {
                    signUp();
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: Text(
                        "Login",
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
        )
      ],
    ));
  }
}
