import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:appcontacts/app/stores/contacts_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';

class FormStore extends MobXStore<Exception, ContactModel> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();

  ContactsStore _contactsStore;

  FormStore(this._contactsStore)
      : super(ContactModel(id: '', name: '', phone: ''));

  Dispose() {
    this.idController.dispose();
    this.nameController.dispose();
    this.phoneController.dispose();
    this.descriptionController.dispose();
  }

  @computed
  bool get contactsStoreLoading => this._contactsStore.isLoading;

  fetchContact(ContactModel? contact) {
    if (contact != null) {
      idController.text = contact.id;
      nameController.text = contact.name;
      phoneController.text = contact.phone;
      descriptionController.text = contact.description ?? '';
      update(contact);
    }
  }

  Future<ContactModel> saveContact() async {
    setLoading(true);

    ContactModel newContact = this._getNewContact();
    update(newContact);
    ContactModel response = await this._contactsStore.saveContact(state);

    setLoading(false);

    return response;
  }

  ContactModel _getNewContact() {
    return new ContactModel(
      id: this.idController.text,
      name: this.nameController.text,
      phone: this.phoneController.text,
      description: this.descriptionController.text,
    );
  }
}
