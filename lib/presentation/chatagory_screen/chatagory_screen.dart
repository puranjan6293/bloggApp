import 'package:firebase_auth/firebase_auth.dart';

import '../../model/blog_model.dart';
import '../../services/blog_service.dart';
import '../blog_screen/blog_screen.dart';
import '../drawer_menu_draweritem/drawer_menu_draweritem.dart';
import '../home_screen/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:pagefly/core/app_export.dart';
import 'package:pagefly/widgets/app_bar/appbar_image.dart';
import 'package:pagefly/widgets/app_bar/appbar_title.dart';
import 'package:pagefly/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ChatagoryScreen extends StatefulWidget {
  final String tag;
  const ChatagoryScreen({
    super.key,
    required this.tag,
  });

  @override
  State<ChatagoryScreen> createState() => _ChatagoryScreenState();
}

class _ChatagoryScreenState extends State<ChatagoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<BlogModel> _blogModel = [];

  final BlogService _blogService = BlogService();
  final User? user = FirebaseAuth.instance.currentUser;

  void _loadBlogs() {
    _blogService.getBlog().listen((blogModel) {
      setState(() {
        _blogModel = blogModel.where((element) {
          return element.tag == widget.tag;
        }).toList();
      });
    });
  }

  @override
  void initState() {
    _loadBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addBloggScreen);
          },
          child: const Icon(
            Icons.post_add,
          ),
        ),
        key: _scaffoldKey,
        backgroundColor: ColorConstant.whiteA700,
        drawer: DrawerMenuDraweritem(),
        appBar: CustomAppBar(
            height: getVerticalSize(73),
            leadingWidth: 47,
            leading: AppbarImage(
                height: getVerticalSize(20),
                width: getHorizontalSize(19),
                svgPath: ImageConstant.imgMenu,
                margin: getMargin(left: 28, top: 18, bottom: 17),
                onTap: () {
                  onTapMenu(context);
                }),
            title: AppbarTitle(text: widget.tag, margin: getMargin(left: 22)),
            actions: [
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
            ]),
        body: SingleChildScrollView(
          // width: double.maxFinite,
          padding: getPadding(top: 8, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: getPadding(top: 24),
                  child: Divider(
                      height: getVerticalSize(1),
                      thickness: getVerticalSize(1),
                      color: ColorConstant.gray40087)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(left: 20, top: 27),
                  child: Text("RECOMENDED FOR YOU",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsSemiBold14),
                ),
              ),

              //! have to add data from database
              Padding(
                padding: getPadding(left: 20, top: 19),
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: getPadding(top: 23.0, bottom: 23.0),
                      child: SizedBox(
                        width: getHorizontalSize(335),
                        child: Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray40087),
                      ),
                    );
                  },
                  itemCount: _blogModel.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogScreen(
                              title: _blogModel[index].title,
                              content: _blogModel[index].content,
                              createdAt: _blogModel[index].createdAt,
                              tag: _blogModel[index].tag,
                              likes:
                                  int.parse(_blogModel[index].likes.toString()),
                              email: _blogModel[index].email,
                              imgLink: _blogModel[index].imgLink,
                            ),
                          ),
                        );
                      },
                      child: HomeItemWidget(
                        title: _blogModel[index].title,
                        content: _blogModel[index].content,
                        createdAt: _blogModel[index].createdAt,
                        tag: _blogModel[index].tag,
                        imgLink: _blogModel[index].imgLink,
                        likes: int.parse(_blogModel[index].likes.toString()),
                        email: _blogModel[index].email,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: getPadding(top: 26, bottom: 5),
                child: Divider(
                  height: getVerticalSize(1),
                  thickness: getVerticalSize(1),
                  color: ColorConstant.gray40087,
                  indent: getHorizontalSize(20),
                  endIndent: getHorizontalSize(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapMenu(BuildContext context) {
    _scaffoldKey.currentState?.openDrawer();
  }
}
