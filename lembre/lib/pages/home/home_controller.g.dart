// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<int>? _$valueComputed;

  @override
  int get value => (_$valueComputed ??=
          Computed<int>(() => super.value, name: '_HomeController.value'))
      .value;
  Computed<ObservableStream<List<TodoModel>>?>? _$todoListComputed;

  @override
  ObservableStream<List<TodoModel>>? get todoList => (_$todoListComputed ??=
          Computed<ObservableStream<List<TodoModel>>?>(() => super.todoList,
              name: '_HomeController.todoList'))
      .value;

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic deleteTodo() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.deleteTodo');
    try {
      return super.deleteTodo();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
todoList: ${todoList}
    ''';
  }
}
