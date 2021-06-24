import 'package:fluttermodular/app/shared/models/poke_model.dart';
import 'package:fluttermodular/app/shared/repositories/poke_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokemonRepository repository;

  @observable
  late ObservableFuture<List<PokemonModel>> pokemons;

  _HomeControllerBase(this.repository) {
    fetchAllPokemons();
  }

  @action
  fetchAllPokemons() {
    pokemons = repository.getAllPokemons().asObservable();
  }
}
