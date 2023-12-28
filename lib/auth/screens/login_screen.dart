
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_button.dart';
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
            child: Form(
              key: formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    MyButton(
                        name: isLoading ? "Loading" : "Login",
                        onTap: () async {
                          if (!isLoading && formkey.currentState!.validate()) {
                            try {
                              setState(() {
                                isLoading = true;
                              });
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: emailController.text,
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
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              setState(() {
                                isLoading = false;
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
          ),
        )
      ],
    ));
  }
}
