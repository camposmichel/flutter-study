import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lembre/app/models/todo_model.dart';

class TodoRepository extends Disposable {
  final FirebaseFirestore firestore;

  TodoRepository({required this.firestore});

  @override
  void dispose() {}

  Stream<List<TodoModel>> get() {
    return this
        .firestore
        .collection('todo')
        .orderBy('position')
        .snapshots()
        .map((query) =>
            query.docs.map((e) => TodoModel.fromDocument((e))).toList());
  }

  Future save(TodoModel model) async {
    CollectionReference todo = FirebaseFirestore.instance.collection('todo');
    QuerySnapshot querySnapshot = await todo.get();
    int total = querySnapshot.docs.length;

    if (model.reference == null) {
      model.reference =
          await FirebaseFirestore.instance.collection('todo').add({
        'title': model.title,
        'check': model.check,
        'position': total,
      });
    } else {
      model.reference!.update({
        'title': model.title,
        'check': model.check,
      });
    }
  }

  Future delete(TodoModel model) {
    return model.reference!.delete();
  }
}
