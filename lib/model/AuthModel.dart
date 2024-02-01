class Tokens {
  String? accessToken;
  String? refreshToken;
  bool? isEnrolled;

  Tokens({this.accessToken, this.refreshToken, this.isEnrolled});

  Tokens.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    isEnrolled = json['isEnrolled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['isEnrolled'] = this.isEnrolled;
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
