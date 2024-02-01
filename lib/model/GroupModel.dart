class GiverGroup {
  Recipient? recipient;
  List<Givers>? givers;

  GiverGroup({this.recipient, this.givers});

  GiverGroup.fromJson(Map<String, dynamic> json) {
    recipient = json['recipient'] != null
        ? new Recipient.fromJson(json['recipient'])
        : null;
    if (json['givers'] != null) {
      givers = <Givers>[];
      json['givers'].forEach((v) {
        givers!.add(new Givers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipient != null) {
      data['recipient'] = this.recipient!.toJson();
    }
    if (this.givers != null) {
      data['givers'] = this.givers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipient {
  String? email;
  String? name;

  Recipient({this.email, this.name});

  Recipient.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}

class Givers {
  String? email;
  String? name;

  Givers({this.email, this.name});

  Givers.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    return data;
  }
}
