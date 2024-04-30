class PostSampleSpace {
  String? video; //filePath
  String? title;
  String? location;
  String? key;

  PostSampleSpace({this.video, this.title, this.location, this.key});

  PostSampleSpace.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    title = json['title'];
    location = json['location'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['title'] = this.title;
    data['location'] = this.location;
    data['key'] = this.key;
    return data;
  }
}

class PostSampleAvatar {
  String? body;
  String? face;
  String? title;
  String? gender;
  String? key;

  PostSampleAvatar({this.body, this.face, this.title, this.gender, this.key});

  PostSampleAvatar.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    face = json['face'];
    title = json['title'];
    gender = json['gender'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['face'] = this.face;
    data['title'] = this.title;
    data['gender'] = this.gender;
    data['key'] = this.key;
    return data;
  }
}
