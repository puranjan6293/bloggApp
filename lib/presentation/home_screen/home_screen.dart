import 'package:firebase_auth/firebase_auth.dart';
import 'package:pagefly/model/blog_model.dart';
import 'package:pagefly/presentation/blog_screen/blog_screen.dart';
import 'package:pagefly/presentation/chatagory_screen/chatagory_screen.dart';
import 'package:pagefly/presentation/home_screen/widgets/app_sceleton.dart';
import 'package:pagefly/services/blog_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../drawer_menu_draweritem/drawer_menu_draweritem.dart';
import '../home_screen/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:pagefly/core/app_export.dart';
import 'package:pagefly/widgets/app_bar/appbar_image.dart';
import 'package:pagefly/widgets/app_bar/appbar_title.dart';
import 'package:pagefly/widgets/app_bar/custom_app_bar.dart';
import 'package:pagefly/widgets/custom_button.dart';

import 'widgets/corausal_slider_widget.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<BlogModel> _blogModel = [];

  //! Set to track liked posts
  // Set<String> likedPosts = <String>{};

  //!by using shared preference
  late SharedPreferences _prefs;
  late String _prefsKey;

  final BlogService _blogService = BlogService();
  final User? user = FirebaseAuth.instance.currentUser;

  void _loadBlogs() {
    _blogService.getBlog().listen((blogModel) {
      setState(() {
        _blogModel = blogModel.toList();
      });
    });
  }

  //! initshared preference function
  Future<void> _initSharedPreference() async {
    _prefs = await SharedPreferences.getInstance();
    _prefsKey = 'liked_posts_${user?.uid}';
    setState(() {});
  }

  @override
  void initState() {
    _loadBlogs();
    _initSharedPreference();
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
          title: AppbarTitle(text: "Home", margin: getMargin(left: 22)),
        ),
        body: SingleChildScrollView(
          // width: double.maxFinite,
          padding: getPadding(top: 8, bottom: 8),
          child: _blogModel.isEmpty
              ? const MySkeletonLoadingWidget()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: getPadding(left: 19),
                        child: SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _blogModel
                                .map((blog) => blog.tag)
                                .toSet()
                                .toList()
                                .length,
                            itemBuilder: ((context, index) {
                              final tags = _blogModel
                                  .map((blog) => blog.tag)
                                  .toSet()
                                  .toList();
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: CustomButton(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ChatagoryScreen(tag: tags[index]),
                                      ),
                                    );
                                  },
                                  height: getVerticalSize(40),
                                  width: getHorizontalSize(83),
                                  text: tags[index],
                                  margin: getMargin(bottom: 1),
                                  variant: ButtonVariant.FillBlack9005e,
                                  shape: ButtonShape.CircleBorder20,
                                  padding: ButtonPadding.PaddingAll9,
                                  fontStyle:
                                      ButtonFontStyle.PoppinsRegular14Black900,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(left: 20, top: 27),
                        child: Text("TRENDING",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold14),
                      ),
                    ),
                    //! Use curaousalWidget here
                    CuraousalWidget(
                      blogmodel: _blogModel,
                    ),

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
                        child: Text("TOP STORIES",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold14),
                      ),
                    ),

                    Padding(
                      padding: getPadding(left: 20, top: 19),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
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
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlogScreen(
                                    title: _blogModel[index].title,
                                    content: _blogModel[index].content,
                                    createdAt: _blogModel[index].createdAt,
                                    tag: _blogModel[index].tag,
                                    likes: int.parse(
                                        _blogModel[index].likes.toString()),
                                    email: _blogModel[index].email,
                                    imgLink: _blogModel[index].imgLink,
                                  ),
                                ),
                              );
                              //!like logic by using shared preference
                              if (_prefs.getBool(
                                      _prefsKey + _blogModel[index].uid) ??
                                  true) {
                                setState(() {
                                  _blogModel[index].likes =
                                      _blogModel[index].likes! + 1;
                                  _blogService.updateBlog(_blogModel[index]);

                                  _prefs.setBool(
                                      _prefsKey + _blogModel[index].uid, false);
                                });
                              }
                            },
                            child: HomeItemWidget(
                              title: _blogModel[index].title,
                              content: _blogModel[index].content,
                              createdAt: _blogModel[index].createdAt,
                              tag: _blogModel[index].tag,
                              imgLink: _blogModel[index].imgLink,
                              likes:
                                  int.parse(_blogModel[index].likes.toString()),
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
