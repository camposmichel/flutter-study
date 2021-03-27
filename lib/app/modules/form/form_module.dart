import 'package:appcontacts/app/modules/form/form_page.dart';
import 'package:appcontacts/app/modules/form/form_store.dart';
import 'package:appcontacts/app/stores/contacts_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FormStore(i.get<ContactsStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => FormPage(contact: args.data)),
  ];
}
