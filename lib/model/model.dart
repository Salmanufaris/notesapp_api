// ignore_for_file: unnecessary_new, prefer_collection_literals

class Model {
  String? title;
  String? description;
  String? id;

  Model({required this.title, required this.description, required this.id});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        title: json['title'], description: json['description'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = title;
    data["description"] = description;
    data["id"] = id;
    return data;
  }
}
