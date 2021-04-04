import 'package:lembre/app/models/todo_model.dart';
import 'package:lembre/app/repositories/todo_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';

class HomeStore extends MobXStore<Exception, int> {
  late final TodoRepository _todoRepository;

  @observable
  late ObservableStream<List<TodoModel>> todoList;

  HomeStore(this._todoRepository) : super(0) {
    this.getList();
  }

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(
      Duration(seconds: 1),
      () {
        print('DELAY');
      },
    );

    int value = state + 1;
    if (value < 5) {
      update(value);
    } else {
      setError(Exception('Error: state not can be > 4'));
    }

    setLoading(false);
  }

  @action
  getList() {
    this.todoList = this._todoRepository.get().asObservable();
    print(this.todoList);
  }

  @action
  void save(TodoModel model) {
    this._todoRepository.save(model);
  }

  @action
  void delete(TodoModel model) {
    this._todoRepository.delete(model);
  }
}
