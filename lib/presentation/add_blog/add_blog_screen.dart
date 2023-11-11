import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pagefly/model/blog_model.dart';
import 'package:pagefly/services/blog_service.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'package:uuid/uuid.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _contentController = TextEditingController();

  final TextEditingController _linkController = TextEditingController();

  final String userEmail = FirebaseAuth.instance.currentUser!.email!;
  final TextEditingController _tagController = TextEditingController();

  final BlogService _blogService = BlogService();

  //!add to firebase function
  void _addBloggToFirebase() {
    final String title = _titleController.text.trim();
    final String content = _contentController.text.trim();
    final String link = _linkController.text.trim();
    final String tag = _tagController.text.trim();

    String uniqueId = const Uuid().v4();

    if (title.isEmpty || content.isEmpty) {
      return;
    }

    BlogModel newBlogModel = BlogModel(
      uid: uniqueId,
      title: title,
      content: content,
      imgLink: link,
      email: userEmail,
      createdAt: DateTime.now(),
      tag: tag,
    );

    _blogService.addBlog(newBlogModel).then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(73),
          leadingWidth: 47,
          leading: BackButton(
            color: Colors.grey[800],
          ),
          title: AppbarTitle(
              text: "What's happening?", margin: getMargin(left: 22)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 18, right: 20),
              child: InkWell(
                onTap: () {
                  _addBloggToFirebase();
                },
                child: Container(
                  width: 60,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[300],
                  ),
                  child: Center(
                    child: Text(
                      'Post',
                      style: AppStyle.txtPoppinsSemiBold16.copyWith(
                        color: ColorConstant.whiteA700,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: AppStyle.txtPoppinsRegular16.copyWith(
                    color: ColorConstant.blueGray300,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                autocorrect: true,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold16,
                cursorColor: ColorConstant.black900,
                maxLines: null,
                controller: _titleController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Image link(optional)',
                  hintStyle: AppStyle.txtPoppinsRegular16.copyWith(
                    color: ColorConstant.blueGray300,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold16,
                cursorColor: ColorConstant.black900,
                controller: _linkController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Tag: Add only one tag, eg: Science',
                  hintStyle: AppStyle.txtPoppinsRegular16.copyWith(
                    color: ColorConstant.blueGray300,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold16,
                cursorColor: ColorConstant.black900,
                controller: _tagController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Content',
                  hintStyle: AppStyle.txtPoppinsRegular16.copyWith(
                    color: ColorConstant.blueGray300,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                autocorrect: true,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold16,
                cursorColor: ColorConstant.black900,
                maxLines: null,
                controller: _contentController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
