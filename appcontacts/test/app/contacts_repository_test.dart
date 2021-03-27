import 'package:flutter_test/flutter_test.dart';
import 'package:appcontacts/app/repositories/contacts_repository.dart';

void main() {
  late ContactsRepository repository;

  setUpAll(() {
    repository = ContactsRepository();
  });
}
