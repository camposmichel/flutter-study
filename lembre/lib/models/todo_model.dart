import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  bool? check;
  int? position;
  String? title;
  DocumentReference? reference;

  TodoModel({
    required this.check,
    required this.position,
    required this.title,
    this.reference,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    check = json['check'];
    position = json['position'];
    title = json['title'];
  }

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
      title: doc['title'],
      check: doc['check'],
      position: doc['position'],
      reference: doc.reference,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check'] = this.check;
    data['position'] = this.position;
    data['title'] = this.title;
    return data;
  }
}
