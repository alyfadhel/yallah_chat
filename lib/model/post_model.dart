class PostModel {
  final String name;
  final String uId;
  final String image;
  final String dateTime;
  final String postImage;
  final String text;

  PostModel({
    required this.name,
    required this.uId,
    required this.image,
    required this.dateTime,
    required this.postImage,
    required this.text,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      name: json['name'],
      uId: json['uId'],
      image: json['image'],
      dateTime: json['dateTime'],
      postImage: json['postImage'],
      text: json['text'],
    );
  }

  Map<String, dynamic> topMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'postImage': postImage,
      'text': text,
    };
  }
}
