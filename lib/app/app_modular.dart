import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttermodular/app/app_controller.dart';
import 'package:fluttermodular/app/pages/home/home_controller.dart';
import 'package:fluttermodular/app/pages/home/home_page.dart';
import 'package:fluttermodular/app/shared/repositories/poke_repository.dart';
import 'package:fluttermodular/app/shared/utils/constants.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
    Bind((i) => HomeController(i.get<PokemonRepository>())),
    Bind((i) => PokemonRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
