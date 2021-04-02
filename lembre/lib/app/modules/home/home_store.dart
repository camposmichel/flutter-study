import 'package:mobx_triple/mobx_triple.dart';

class HomeStore extends MobXStore<Exception, int> {
  HomeStore() : super(0);

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
}
