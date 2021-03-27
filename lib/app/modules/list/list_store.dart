import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:appcontacts/app/stores/contacts_store.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';

class ListStore extends MobXStore<Exception, ObservableList<ContactModel>> {
  final ContactsStore _contactStore;

  ListStore(this._contactStore) : super(ObservableList.of([]));

  loadContactList() async {
    setLoading(true);
    await this._contactStore.loadContactList();
    update(this._contactStore.state);
    setLoading(false);
  }
}
