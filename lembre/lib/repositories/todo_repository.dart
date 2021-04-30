import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lembre/models/todo_model.dart';

class TodoRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<TodoModel>> getAll() {
    return firestore.collection('todo').orderBy('position').snapshots().map(
      (query) {
        return query.docs.map((doc) {
          return TodoModel.fromDocument(doc);
        }).toList();
      },
    );
  }
}
