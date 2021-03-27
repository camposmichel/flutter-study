import 'package:appcontacts/app/models/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'list_store.dart';

enum ListOptionsEnum { edit, delete }

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({Key? key, this.title = "Contact List"}) : super(key: key);
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends ModularState<ListPage, ListStore> {
  // final GlobalKey _menuKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    store.loadContactList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (BuildContext _) {
        final contactList = store.contactList;

        if (store.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
          child: ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(contactList[index].name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(contactList[index].phone),
                    Text(contactList[index].description ?? ''),
                  ],
                ),
                trailing: this._buildMenu(contactList[index]),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Modular.to.pushNamed('/form');
        },
      ),
    );
  }

  _confirmDelete(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deletar'),
          content: Text('Voçê tem certeza que deseja deletar esse usuário?'),
          actions: <Widget>[
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                store.deleteContact(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  PopupMenuButton _buildMenu(ContactModel contact) {
    return PopupMenuButton<ListOptionsEnum>(
      onSelected: (ListOptionsEnum result) {
        switch (result) {
          case ListOptionsEnum.edit:
            Modular.to.pushNamed('/form', arguments: contact);
            break;
          case ListOptionsEnum.delete:
            this._confirmDelete(contact.id);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ListOptionsEnum>>[
        const PopupMenuItem(
          value: ListOptionsEnum.edit,
          child: Text('Editar'),
        ),
        const PopupMenuItem(
          value: ListOptionsEnum.delete,
          child: Text('Deletar'),
        ),
      ],
    );
  }
}
