class BadgeBundle {
  List<Badges>? badges;

  BadgeBundle({this.badges});

  BadgeBundle.fromJson(Map<String, dynamic> json) {
    if (json['badges'] != null) {
      badges = <Badges>[];
      json['badges'].forEach((v) {
        badges!.add(new Badges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Badges {
  String? type;
  String? createdAt;

  Badges({this.type, this.createdAt});

  Badges.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
