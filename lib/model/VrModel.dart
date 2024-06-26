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
  bool? isSample;
  List<String>? storageUrls; // 이 url로가서 직접 다운받으면 됨. 그리고 이 앱에 저장.
  String? createdAt;
  String? inVideoPositionFile;

  VrResources(
      {this.id,
      this.title,
      this.type,
      this.isSample,
      this.storageUrls,
      this.createdAt,
      this.inVideoPositionFile});

  VrResources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    isSample = json['isSample'];
    storageUrls = json['storageUrls'].cast<String>();
    createdAt = json['createdAt'];
    inVideoPositionFile = json['inVideoPositionFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['isSample'] = this.isSample;
    data['storageUrls'] = this.storageUrls;
    data['createdAt'] = this.createdAt;
    data['inVideoPositionFile'] = this.inVideoPositionFile;
    return data;
  }
}

class PostSpace {
  String? video; //filePath
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
  String? body; //filePath
  String? face; //filePath
  String? title;
  String? gender;

  PostAvatar({this.body, this.face, this.title, this.gender});

  PostAvatar.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    face = json['face'];
    title = json['title'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['face'] = this.face;
    data['title'] = this.title;
    data['gender'] = this.gender;
    return data;
  }
}

class GetVrVideo {
  String? id;
  String? title;
  bool? isSample;
  VrResources? scene;
  List<VrResources>? avatars;

  GetVrVideo({this.id, this.title, this.isSample, this.scene, this.avatars});
  GetVrVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isSample = json['isSample'];
    scene = VrResources.fromJson(json['scene']);
    avatars = <VrResources>[];
    if (json['avatars'] != null) {
      json['avatars'].forEach((v) {
        avatars!.add(VrResources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['isSample'] = this.isSample;
    if (scene != null) {
      data['scene'] = scene!.toJson();
    }
    if (avatars != null) {
      data['avatars'] = avatars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostVrVideo {
  String? title;
  SceneInfo? sceneInfo;
  List<AvatarsInfo>? avatarsInfo;
  String? key;

  PostVrVideo({this.title, this.sceneInfo, this.avatarsInfo, this.key});

  PostVrVideo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sceneInfo = json['sceneInfo'] != null
        ? new SceneInfo.fromJson(json['sceneInfo'])
        : null;
    if (json['avatarsInfo'] != null) {
      avatarsInfo = <AvatarsInfo>[];
      json['avatarsInfo'].forEach((v) {
        avatarsInfo!.add(new AvatarsInfo.fromJson(v));
      });
    }
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.sceneInfo != null) {
      data['sceneInfo'] = this.sceneInfo!.toJson();
    }
    if (this.avatarsInfo != null) {
      data['avatarsInfo'] = this.avatarsInfo!.map((v) => v.toJson()).toList();
    }
    data['key'] = this.key;
    return data;
  }
}

class AvatarsInfo {
  String? resourceId;
  ObjectData? objectData;

  AvatarsInfo({this.resourceId, this.objectData});

  AvatarsInfo.fromJson(Map<String, dynamic> json) {
    resourceId = json['resourceId'];
    objectData = json['objectData'] != null
        ? new ObjectData.fromJson(json['objectData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceId'] = this.resourceId;
    if (this.objectData != null) {
      data['objectData'] = this.objectData!.toJson();
    }
    return data;
  }
}

class SceneInfo {
  String? resourceId;
  ObjectData? objectData;

  SceneInfo({this.resourceId, this.objectData});

  SceneInfo.fromJson(Map<String, dynamic> json) {
    resourceId = json['resourceId'];
    objectData = json['objectData'] != null
        ? new ObjectData.fromJson(json['objectData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceId'] = this.resourceId;
    if (this.objectData != null) {
      data['objectData'] = this.objectData!.toJson();
    }
    return data;
  }
}

class ObjectData {
  Scale? scale;
  Scale? position;
  Rotation? rotation;

  ObjectData({this.scale, this.position, this.rotation});

  ObjectData.fromJson(Map<String, dynamic> json) {
    scale = json['scale'] != null ? new Scale.fromJson(json['scale']) : null;
    position =
        json['position'] != null ? new Scale.fromJson(json['position']) : null;
    rotation = json['rotation'] != null
        ? new Rotation.fromJson(json['rotation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scale != null) {
      data['scale'] = this.scale!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    if (this.rotation != null) {
      data['rotation'] = this.rotation!.toJson();
    }
    return data;
  }
}

class Scale {
  int? x;
  int? y;
  int? z;

  Scale({this.x, this.y, this.z});

  Scale.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    z = json['z'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['z'] = this.z;
    return data;
  }
}

class Rotation {
  int? x;
  int? y;
  int? z;
  int? w;

  Rotation({this.x, this.y, this.z, this.w});

  Rotation.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    z = json['z'];
    w = json['w'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['z'] = this.z;
    data['w'] = this.w;
    return data;
  }
}
