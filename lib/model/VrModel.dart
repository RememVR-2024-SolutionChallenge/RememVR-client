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
  String? title;
  String? filePath;
  String? type;
  String? createdAt;

  VrResources({this.title, this.filePath, this.type, this.createdAt});

  VrResources.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    filePath = json['filePath'];
    type = json['type'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['filePath'] = this.filePath;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
