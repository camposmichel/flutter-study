import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:appcontacts/app/stores/contacts_store.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';

class ListStore extends MobXStore<Exception, int> {
  final ContactsStore _contactStore;

  ListStore(this._contactStore) : super(0);

  @computed
  List<ContactModel> get contactList => _contactStore.state;

  loadContactList() async {
    setLoading(true);
    await this._contactStore.loadContactList();
    setLoading(false);
  }

  void deleteContact(String id) async {
    setLoading(true);
    await this._contactStore.deleteContact(id);
    setLoading(false);
  }
}
