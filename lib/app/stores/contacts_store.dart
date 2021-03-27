import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:appcontacts/app/repositories/contacts_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';

class ContactsStore extends MobXStore<Exception, ObservableList<ContactModel>> {
  final ContactsRepository _repository;

  ContactsStore(this._repository) : super(ObservableList.of([]));

  Future<void> loadContactList() async {
    setLoading(true);
    List<ContactModel> response = await this._repository.getContactList();
    update(response.asObservable());
    setLoading(false);
  }

  Future<void> createContact(ContactModel contact) async {
    setLoading(true);
    ContactModel response = await this._repository.createContact(contact);
    update([...state, response].asObservable());
    setLoading(false);
  }

  Future<void> deleteContact(String id) async {
    setLoading(true);
    await this._repository.deleteContact(id);
    this.loadContactList();
    setLoading(false);
  }
}
