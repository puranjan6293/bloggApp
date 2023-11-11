import 'package:flutter/material.dart';
import 'package:pagefly/core/app_export.dart';
import 'package:pagefly/widgets/app_bar/appbar_image.dart';
import 'package:pagefly/widgets/app_bar/custom_app_bar.dart';
import 'package:pagefly/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class SearchTopicsScreen extends StatelessWidget {
  TextEditingController searchBarController = TextEditingController();

  SearchTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(62),
                leadingWidth: 34,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 10, top: 16, bottom: 16),
                    onTap: () {
                      onTapArrowleft(context);
                    }),
                title: CustomSearchView(
                    width: getHorizontalSize(311),
                    focusNode: FocusNode(),
                    controller: searchBarController,
                    hintText: "Search",
                    margin: getMargin(left: 10),
                    prefix: Container(
                        margin:
                            getMargin(left: 12, top: 17, right: 14, bottom: 17),
                        child:
                            CustomImageView(svgPath: ImageConstant.imgSearch)),
                    prefixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(48)),
                    suffix: Padding(
                        padding: EdgeInsets.only(right: getHorizontalSize(15)),
                        child: IconButton(
                            onPressed: () {
                              searchBarController.clear();
                            },
                            icon: Icon(Icons.clear,
                                color: Colors.grey.shade600))))),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 18, right: 20, bottom: 18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Explore Topics",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsBold20),
                      Padding(
                          padding: getPadding(top: 8),
                          child: Text("Books",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 9),
                          child: Text("Fiction",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("Comics",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("Art",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 12),
                          child: Text("Visual Design",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("Technology",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 7),
                          child: Text("Science",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("Business",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 12),
                          child: Text("Psychology",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 9),
                          child: Text("Creativity",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 7),
                          child: Text("Education",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("Feminism",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 12),
                          child: Text("Artificial Intelligence",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 7),
                          child: Text("Health",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20)),
                      Padding(
                          padding: getPadding(top: 12, bottom: 5),
                          child: Text("Design",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular20))
                    ]))));
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
