import 'package:lembre/models/todo_model.dart';
import 'package:lembre/repositories/todo_repository.dart';
import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  TodoRepository _repository = TodoRepository();

  @observable
  ObservableStream<List<TodoModel>>? list;

  _TodoStore() : super() {
    getList();
  }

  @action
  void getList() {
    list = _repository.getAll().asObservable();
  }
}
