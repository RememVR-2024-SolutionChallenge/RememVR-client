class UserInfo {
  String? email;
  String? name;
  String? role;
  bool? isEnrolled;
  String? createdAt;

  UserInfo({this.email, this.name, this.role, this.isEnrolled, this.createdAt});

  UserInfo.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    role = json['role'];
    isEnrolled = json['isEnrolled'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['role'] = this.role;
    data['isEnrolled'] = this.isEnrolled;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
