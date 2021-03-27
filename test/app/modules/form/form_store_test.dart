import 'package:flutter_test/flutter_test.dart';
import 'package:appcontacts/app/modules/form/form_store.dart';
 
void main() {
  late FormStore store;

  setUpAll(() {
    store = FormStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}