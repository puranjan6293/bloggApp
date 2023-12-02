import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pagefly/core/app_export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    try {
      // ignore: unused_local_variable
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, AppRoutes.homeScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 27,
              top: 26,
              right: 27,
              bottom: 26,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgMobNoBg,
                  height: getSize(
                    69,
                  ),
                  width: getSize(
                    69,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 36,
                  ),
                  child: Text(
                    "Welcome back.",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPlantagenetCherokee32,
                  ),
                ),
                Container(
                  margin: getMargin(
                    left: 1,
                    top: 34,
                    right: 2,
                  ),
                  padding: getPadding(
                    left: 15,
                    top: 8,
                    right: 15,
                    bottom: 8,
                  ),
                  decoration: AppDecoration.outlineBlack900.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder20,
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: AppStyle.txtPoppinsRegular14Gray40001,
                      border: InputBorder.none,
                    ),
                    style: AppStyle.txtPoppinsSemiBold16,
                  ),
                ),
                Container(
                  margin: getMargin(
                    left: 1,
                    top: 10,
                    right: 2,
                  ),
                  padding: getPadding(
                    left: 15,
                    top: 8,
                    right: 15,
                    bottom: 8,
                  ),
                  decoration: AppDecoration.outlineBlack900.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder20,
                  ),
                  child: TextField(
                    controller: _passwordController,
                    style: AppStyle.txtPoppinsSemiBold16,
                    cursorColor: ColorConstant.black900,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: AppStyle.txtPoppinsRegular14Gray40001,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //signin button
                Padding(
                  padding: getPadding(
                    top: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: Container(
                      width: getSize(
                        315,
                      ),
                      height: getSize(
                        50,
                      ),
                      decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder20,
                      ),
                      child: Center(
                        child: Text(
                          "Sign in",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsBold20,
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 36,
                      top: 36,
                      right: 5,
                      bottom: 5,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 1,
                          ),
                          child: Text(
                            "Don’t have an account? ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular14,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 7,
                            top: 1,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.signUpScreen);
                            },
                            child: Text(
                              "Sign up.",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular14LightblueA200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
