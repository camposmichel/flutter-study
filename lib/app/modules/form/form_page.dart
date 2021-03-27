import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:appcontacts/app/modules/form/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormPage extends StatefulWidget {
  final String title;
  const FormPage({Key? key, this.title = "FormPage"}) : super(key: key);
  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends ModularState<FormPage, FormStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: store.idController,
                decoration: InputDecoration(labelText: 'ID'),
              ),
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
                  var newContact = new ContactModel(
                    id: store.idController.text,
                    name: store.nameController.text,
                    phone: store.phoneController.text,
                    description: store.descriptionController.text == ''
                        ? ''
                        : store.descriptionController.text,
                  );

                  store.createContact(newContact);
                  Modular.to.pop();
                },
              )
            ],
          ),
        ),
      ),
      // body: Column(
      //   children: <Widget>[
      //     TextField(
      //       decoration: InputDecoration(
      //         labelText: 'ID',
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
