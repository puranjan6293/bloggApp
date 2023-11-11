import 'package:flutter/material.dart';
import 'package:pagefly/core/app_export.dart';
import 'package:pagefly/widgets/app_bar/appbar_image.dart';
import 'package:pagefly/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:pagefly/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:pagefly/widgets/app_bar/custom_app_bar.dart';
import 'package:timeago/timeago.dart' as timeago;

class BlogScreen extends StatefulWidget {
  final String title;
  final String content;
  final String? imgLink;
  final DateTime createdAt;
  final String tag;
  final int likes;
  final String email;
  const BlogScreen({
    super.key,
    required this.title,
    required this.content,
    this.imgLink,
    required this.createdAt,
    required this.tag,
    required this.likes,
    required this.email,
  });

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            59,
          ),
          title: AppbarSubtitle2(
            text: "Blog by ${widget.email.toUpperCase().substring(0, 3)}",
            margin: getMargin(
              left: 28,
            ),
          ),
          actions: [
            Container(
              height: getSize(
                3,
              ),
              width: getSize(
                3,
              ),
              margin: getMargin(
                left: 10,
                top: 34,
                right: 7,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.black90087,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    1,
                  ),
                ),
              ),
            ),
            AppbarSubtitle1(
              text: timeago.format(widget.createdAt),
              margin: getMargin(
                left: 8,
                top: 26,
                right: 7,
              ),
            ),
            AppbarImage(
              onTap: () {
                Navigator.pop(context);
              },
              height: getSize(
                36,
              ),
              width: getSize(
                36,
              ),
              svgPath: ImageConstant.imgCheckmark,
              margin: getMargin(
                left: 48,
                top: 7,
                right: 22,
                bottom: 4,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 27,
              top: 14,
              right: 27,
              bottom: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getHorizontalSize(
                    263,
                  ),
                  margin: getMargin(
                    left: 1,
                    right: 56,
                  ),
                  child: Text(
                    widget.title,
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold24,
                  ),
                ),
                CustomImageView(
                  fit: BoxFit.cover,
                  imagePath: ImageConstant.imgBlogthumbnail80x80,
                  url: widget.imgLink,
                  height: getVerticalSize(
                    220,
                  ),
                  width: getHorizontalSize(
                    320,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      5,
                    ),
                  ),
                  margin: getMargin(
                    top: 19,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      top: 12,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Image Credit: ",
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                12,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: widget.email.toLowerCase().substring(0, 3),
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                12,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    295,
                  ),
                  margin: getMargin(
                    left: 1,
                    top: 30,
                    right: 24,
                    bottom: 5,
                  ),
                  child: SelectableText(
                    widget.content,
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular14,
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
