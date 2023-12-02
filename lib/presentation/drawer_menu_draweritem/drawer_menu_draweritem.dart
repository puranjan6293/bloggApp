import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pagefly/core/app_export.dart';

class DrawerMenuDraweritem extends StatelessWidget {
  DrawerMenuDraweritem({super.key});
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: getHorizontalSize(287),
        padding: getPadding(left: 27, top: 29, right: 27, bottom: 29),
        decoration: AppDecoration.fillWhiteA700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: getPadding(left: 1, top: 13),
                child: Row(children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMobNoBg,
                    height: getVerticalSize(62),
                    width: getHorizontalSize(59),
                  ),
                  Padding(
                      padding: getPadding(left: 16, top: 5, bottom: 7),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Welcome",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular14Gray40001),
                            Padding(
                                padding: getPadding(top: 2),
                                child: Text(
                                    "@${user!.email!.substring(0, 3).toString().toUpperCase()}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium18))
                          ]))
                ])),
            Padding(
                padding: getPadding(top: 34),
                child: Divider(
                    height: getVerticalSize(1),
                    thickness: getVerticalSize(1),
                    color: ColorConstant.black90067,
                    indent: getHorizontalSize(1))),
            InkWell(
                onTap: () {
                  onTapTxtHome(context);
                },
                child: Padding(
                    padding: getPadding(left: 1, top: 67),
                    child: Text("Home",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsMedium18))),
            InkWell(
                onTap: () {
                  onTapTxtAudio(context);
                },
                child: Padding(
                    padding: getPadding(left: 1, top: 28),
                    child: Text("Explore",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsMedium18))),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.userBlogs,
                  );
                },
                child: Padding(
                    padding: getPadding(left: 1, top: 28),
                    child: Text("Your Blogs",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsMedium18))),
            const Spacer(),
            Divider(
              height: getVerticalSize(1),
              thickness: getVerticalSize(1),
              color: ColorConstant.black90067,
              indent: getHorizontalSize(1),
            ),
            user!.email != null
                ? InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, AppRoutes.signInScreen);
                    },
                    child: Padding(
                        padding: getPadding(left: 1, top: 28),
                        child: Text("Logout",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium18)))
                : InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signInScreen);
                    },
                    child: Padding(
                      padding: getPadding(left: 1, top: 28),
                      child: Text("Login",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium18),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  onTapTxtHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  onTapTxtAudio(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.exploreScreen);
  }

  onTapTxtTermAndCondition(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.termsAndConditionsScreen);
  }

  onTapTxtNewStory(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.privacyPolicyScreen);
  }
}
