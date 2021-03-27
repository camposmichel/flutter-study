import 'package:appcontacts/app/modules/list/list_page.dart';
import 'package:appcontacts/app/modules/list/list_store.dart';
import 'package:appcontacts/app/stores/contacts_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListStore(i.get<ContactsStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ListPage()),
  ];
}
