// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStore, Store {
  final _$listAtom = Atom(name: '_TodoStore.list');

  @override
  ObservableStream<List<TodoModel>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableStream<List<TodoModel>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_TodoStoreActionController = ActionController(name: '_TodoStore');

  @override
  void getList() {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.getList');
    try {
      return super.getList();
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
