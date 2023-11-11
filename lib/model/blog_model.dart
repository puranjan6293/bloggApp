class BlogModel {
  String title;
  String content;
  String? imgLink;
  DateTime createdAt;
  String tag;
  int? likes;
  String uid;
  String email;

  BlogModel({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.tag,
    this.imgLink,
    required this.uid,
    required this.email,
    this.likes = 0,
  });

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      title: map['title'],
      content: map['content'],
      createdAt: map['createdAt'].toDate(),
      tag: map['tag'],
      imgLink: map['imgLink'],
      uid: map['uid'],
      email: map['email'],
      likes: map['likes'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'tag': tag,
      'imgLink': imgLink,
      'uid': uid,
      'email': email,
      'likes': likes,
    };
  }
}
