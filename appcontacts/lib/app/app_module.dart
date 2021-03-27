import 'package:appcontacts/app/modules/form/form_module.dart';
import 'package:appcontacts/app/modules/list/list_module.dart';
import 'package:appcontacts/app/stores/contacts_store.dart';
import 'package:appcontacts/app/repositories/contacts_repository.dart';
import 'package:appcontacts/app/utils/consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ContactsRepository(i.get())),
    Bind.lazySingleton((i) => ContactsStore(i.get())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: ListModule()),
    ModuleRoute('/form', module: FormModule()),
  ];
}
