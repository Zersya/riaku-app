import 'package:riaku_app/models/user.dart';

class Post {
  User user;
  String id;
  List likes;

  final String description;
  final String imgUrl;
  final String createdAt;

  Post(this.user, this.description, this.imgUrl, this.createdAt,
      {this.id, this.likes});

  void setUser(User user) {
    this.user = user;
  }

  void addLikes(String userId) {
    likes.add(userId);
  }

  factory Post.formMap(Map<String, dynamic> map) {
    return Post(
      User.fromMap(map['user']),
      map['description'],
      map['imgUrl'],
      map['createdAt'],
      id: map['id'],
      likes: map['likes'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'user': this.user.toMap(),
        'description': this.description,
        'imgUrl': this.imgUrl,
        'createdAt': this.createdAt,
        'likes': this.likes ?? List(),
      };
}
