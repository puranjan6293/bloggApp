// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pagefly/model/blog_model.dart';
import 'package:pagefly/presentation/blog_screen/blog_screen.dart';

class CuraousalWidget extends StatefulWidget {
  List<BlogModel> blogmodel;

  CuraousalWidget({
    Key? key,
    required this.blogmodel,
  }) : super(key: key);

  @override
  State<CuraousalWidget> createState() => _CuraousalWidgetState();
}

class _CuraousalWidgetState extends State<CuraousalWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      itemCount: widget.blogmodel.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlogScreen(
                        title: widget.blogmodel[index].title,
                        imgLink: widget.blogmodel[index].imgLink,
                        content: widget.blogmodel[index].content,
                        createdAt: widget.blogmodel[index].createdAt,
                        tag: widget.blogmodel[index].tag,
                        likes:
                            int.parse(widget.blogmodel[index].likes.toString()),
                        email: widget.blogmodel[index].email)));
          },
          child: Container(
            width: 360,
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.blogmodel[index].imgLink!,
                    fit: BoxFit.cover,
                    width: 360,
                    height: 360,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Text(
                      widget.blogmodel[index].title.length > 50
                          ? "${widget.blogmodel[index].title.substring(0, 50)}..."
                          : widget.blogmodel[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
