import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pagefly/model/blog_model.dart';
import 'package:pagefly/services/blog_service.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'package:uuid/uuid.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({Key? key}) : super(key: key);

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final String userEmail = FirebaseAuth.instance.currentUser!.email!;
  final BlogService _blogService = BlogService();

  void _addBlogToFirebase() {
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
          text: "What's happening?",
          margin: getMargin(left: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 18, right: 20),
            child: InkWell(
              onTap: () {
                _addBlogToFirebase();
              },
              child: Container(
                width: 80,
                height: 43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.shade300,
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
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: AppStyle.txtPoppinsRegular16.copyWith(
                  color: Colors.blue,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
              ),
              style: AppStyle.txtPoppinsSemiBold16,
              controller: _titleController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Image link (optional)',
                labelStyle: AppStyle.txtPoppinsRegular16.copyWith(
                  color: Colors.blue,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
              ),
              style: AppStyle.txtPoppinsSemiBold16,
              controller: _linkController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tag: Add only one tag, e.g., Science',
                labelStyle: AppStyle.txtPoppinsRegular16.copyWith(
                  color: Colors.blue,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
              ),
              style: AppStyle.txtPoppinsSemiBold16,
              controller: _tagController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Content',
                labelStyle: AppStyle.txtPoppinsRegular16.copyWith(
                  color: Colors.blue,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
              ),
              style: AppStyle.txtPoppinsSemiBold16,
              maxLines: null,
              controller: _contentController,
            ),
          ],
        ),
      ),
    );
  }
}
