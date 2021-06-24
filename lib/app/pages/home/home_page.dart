import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttermodular/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (homeController.pokemons.error != null) {
            return Center(
              child: TextButton(
                child: Text("Press Again"),
                onPressed: () {
                  homeController.fetchAllPokemons();
                },
              ),
            );
          }

          if (homeController.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var list = homeController.pokemons.value;

          return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(list![index].name),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Modular.to.pushNamed('/other');
        },
      ),
    );
  }
}
