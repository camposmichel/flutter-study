import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactsRepository extends Disposable {
  final Dio _dio;

  ContactsRepository(this._dio);

  @override
  void dispose() {}

  Future<List<ContactModel>> getContactList() async {
    List<ContactModel> contacts = [];
    final Response response = await _dio.get('/contacts');

    for (var json in (response.data as List)) {
      contacts.add(ContactModel.fromJson(json));
    }
    return contacts;
  }

  Future<ContactModel> saveContact(ContactModel contact) async {
    Response response;

    if (contact.id == '') {
      response = await _dio.post('/contacts', data: contact.toJson());
    } else {
      response =
          await _dio.put('/contacts/${contact.id}', data: contact.toJson());
    }

    return ContactModel.fromJson(response.data);
  }

  Future<void> deleteContact(String id) async {
    await _dio.delete('/contacts/$id');
    // return response.data;
  }
}
