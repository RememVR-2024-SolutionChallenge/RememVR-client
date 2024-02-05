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
