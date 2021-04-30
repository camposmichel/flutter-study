import 'package:lembre/models/todo_model.dart';
import 'package:lembre/stores/todo/todo_store.dart';
import 'package:mobx/mobx.dart';
import 'package:lembre/stores/counter/counter_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final _counterStore = Counter();
  final _todoStore = TodoStore();

  @computed
  int get value => _counterStore.value;

  @computed
  ObservableStream<List<TodoModel>>? get todoList => _todoStore.list;

  @action
  deleteTodo() {}

  increment() => _counterStore.increment();
}
