class NoteModel {
  String? status;
  String? message;
  List<Data>? data;

  NoteModel({this.status, this.message, this.data});

  NoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? body;
  String? createdAt;
  bool? archived;
  String? owner;
  Data(
      {this.id,
      this.title,
      this.body,
      this.createdAt,
      this.archived,
      this.owner});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['createdAt'];
    archived = json['archived'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['createdAt'] = this.createdAt;
    data['archived'] = this.archived;
    data['owner'] = this.owner;
    return data;
  }
}
