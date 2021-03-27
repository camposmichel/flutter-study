import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:appcontacts/app/modules/form/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormPage extends StatefulWidget {
  final String title;
  final ContactModel? contact;
  const FormPage({Key? key, this.title = "Contact Form", this.contact})
      : super(key: key);
  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends ModularState<FormPage, FormStore> {
  @override
  void initState() {
    super.initState();
    store.fetchContact(widget.contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext _) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return buildForm();
        },
      ),
    );
  }

  Widget buildForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          TextFormField(
            controller: store.nameController,
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          TextFormField(
            controller: store.phoneController,
            decoration: InputDecoration(labelText: 'Telefone'),
          ),
          TextFormField(
            controller: store.descriptionController,
            decoration: InputDecoration(labelText: 'Descrição (Opcional)'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () {
              store.saveContact().then((value) => {Modular.to.pop()});
            },
          )
        ],
      ),
    );
  }
}
