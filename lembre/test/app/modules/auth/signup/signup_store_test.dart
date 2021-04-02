import 'package:flutter_test/flutter_test.dart';
import 'package:lembre/app/modules/auth/signup/signup_store.dart';
 
void main() {
  late SignupStore store;

  setUpAll(() {
    store = SignupStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}