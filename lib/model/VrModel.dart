class Queue {
  String? type;
  String? status;
  String? title;

  Queue({this.type, this.status, this.title});

  Queue.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['status'] = this.status;
    data['title'] = this.title;
    return data;
  }
}

class VrResources {
  String? id;
  String? title;
  String? type;
  List<String>? storageUrls; // 이 url로가서 직접 다운받으면 됨. 그리고 이 앱에 저장.
  String? createdAt;

  VrResources(
      {this.id, this.title, this.type, this.storageUrls, this.createdAt});

  VrResources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    storageUrls = json['storageUrls'].cast<String>();
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['storageUrls'] = this.storageUrls;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class PostSpace {
  String? video;
  String? title;
  String? location;

  PostSpace({this.video, this.title, this.location});

  PostSpace.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    title = json['title'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['title'] = this.title;
    data['location'] = this.location;
    return data;
  }
}

class PostAvatar {
  String? video;
  String? image;
  String? title;
  String? gender;

  PostAvatar({this.video, this.image, this.title, this.gender});

  PostAvatar.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    image = json['image'];
    title = json['title'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['image'] = this.image;
    data['title'] = this.title;
    data['gender'] = this.gender;
    return data;
  }
}
