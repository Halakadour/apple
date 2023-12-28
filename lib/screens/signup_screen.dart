import 'package:apple/screens/login_screen.dart';
import 'package:apple/widgets/custom_button.dart';
import 'package:apple/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isloading = false;

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
                  name: isloading ? "Loading" : "Signup",
                  onTap: () async {
                    if (!isloading && formkey.currentState!.validate()) {
                      try {
                        setState(() {
                          isloading = true;
                        });
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        setState(() {
                          isloading = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          isloading = false;
                        });
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        setState(() {
                          isloading = false;
                        });
                        print(e);
                      }
                    }
                  }),
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
                              builder: (context) => LoginScreen(),
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
