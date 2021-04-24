import 'package:mobx/mobx.dart';
import 'package:lembre/stores/counter_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final _counterStore = Counter();

  @computed
  int get value => _counterStore.value;

  increment() => _counterStore.increment();
}
