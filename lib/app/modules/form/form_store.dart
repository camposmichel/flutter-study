import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:appcontacts/app/stores/contacts_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx_triple/mobx_triple.dart';

class FormStore extends MobXStore<Exception, ContactModel> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();

  ContactsStore _contactsStore;

  FormStore(this._contactsStore)
      : super(ContactModel(id: '', name: '', phone: ''));

  createContact() async {
    setLoading(true);

    ContactModel newContact = this._getNewContact();
    update(newContact);
    await this._contactsStore.createContact(state);

    setLoading(false);
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
