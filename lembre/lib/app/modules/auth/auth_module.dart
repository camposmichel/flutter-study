import 'package:flutter_modular/flutter_modular.dart';
import 'signin/signin_module.dart';
import 'signup/signup_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SigninModule()),
    ModuleRoute('signin', module: SigninModule()),
    ModuleRoute('signup', module: SignupModule()),
  ];
}
