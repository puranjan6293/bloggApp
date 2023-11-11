import 'package:flutter/material.dart';
import 'package:pagefly/core/app_export.dart';
import 'package:timeago/timeago.dart' as timeago;

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  final String title;
  final String content;
  final String? imgLink;
  final DateTime createdAt;
  final String tag;
  final int likes;
  final String email;

  const HomeItemWidget({
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "@${email.toUpperCase().substring(0, 3)}",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold12,
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Text(
                  title,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsSemiBold16,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 13,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Text(
                        timeago.format(createdAt),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsMedium12,
                      ),
                    ),
                    Container(
                      height: getSize(
                        3,
                      ),
                      width: getSize(
                        3,
                      ),
                      margin: getMargin(
                        left: 10,
                        top: 8,
                        bottom: 8,
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
                    Padding(
                      padding: getPadding(
                        left: 12,
                        bottom: 1,
                      ),
                      child: Text(
                        likes.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsMedium12,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgBookmark,
                      height: getVerticalSize(
                        17,
                      ),
                      width: getHorizontalSize(
                        13,
                      ),
                      margin: getMargin(
                        left: 64,
                        bottom: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CustomImageView(
          fit: BoxFit.cover,
          imagePath: ImageConstant.imgBlogthumbnail80x80,
          url: imgLink,
          height: getSize(
            80,
          ),
          width: getSize(
            80,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              3,
            ),
          ),
          margin: getMargin(
            left: 15,
            bottom: 1,
            right: 1,
          ),
        ),
      ],
    );
  }
}
