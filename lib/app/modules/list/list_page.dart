import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'list_store.dart';

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({Key? key, this.title = "Contact List"}) : super(key: key);
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends ModularState<ListPage, ListStore> {
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

        return ListView.builder(
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
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  this._confirmDelete(contactList[index].id);
                },
              ),
            );
          },
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

  Future<void> _confirmDelete(String id) async {
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
}
