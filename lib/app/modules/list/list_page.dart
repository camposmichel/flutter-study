import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'list_store.dart';

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({Key? key, this.title = "ListPage"}) : super(key: key);
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
        final contactList = store.state;

        if (store.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(contactList[index].name));
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
}
