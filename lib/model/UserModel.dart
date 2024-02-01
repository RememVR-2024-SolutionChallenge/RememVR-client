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

class SignUpInfo {
  String? name;
  String? role;

  SignUpInfo({this.name, this.role});

  SignUpInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['role'] = this.role;
    return data;
  }
}

class EmailInfo {
  String? email;

  EmailInfo({this.email});

  EmailInfo.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}

class CodeInfo {
  String? email;
  String? certificate;

  CodeInfo({this.email, this.certificate});

  CodeInfo.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    certificate = json['certificate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['certificate'] = this.certificate;
    return data;
  }
}
