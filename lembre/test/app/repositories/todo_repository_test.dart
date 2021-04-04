import 'package:flutter_test/flutter_test.dart';
import 'package:lembre/app/repositories/todo_repository.dart';
 
void main() {
  late TodoRepository repository;

  setUpAll(() {
    repository = TodoRepository();
  });
}