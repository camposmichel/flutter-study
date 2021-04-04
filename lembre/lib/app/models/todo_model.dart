import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String id = '';
  String title = '';
  bool check = false;
  int position = 0;
  DocumentReference? reference;

  TodoModel({
    this.id = '',
    this.title = '',
    this.check = false,
    this.position = 0,
    this.reference,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    check = json['check'];
    position = json['position'];
    reference = json['reference'];
  }

  factory TodoModel.fromDocument(QueryDocumentSnapshot documentSnapshot) {
    var data = documentSnapshot.data()!;
    // print(data);
    // var teste = data!['title'];
    // print(teste);
    return TodoModel(
      title: data['title'],
      check: data['check'],
      position: data['position'],
      reference: documentSnapshot.reference,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['check'] = this.check;
    data['position'] = this.position;
    data['reference'] = this.reference;
    return data;
  }
}
