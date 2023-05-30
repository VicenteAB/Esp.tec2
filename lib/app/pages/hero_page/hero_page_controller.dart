import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:plantilla_ca/app/pages/hero_page/hero_page_presenter.dart';
import 'package:plantilla_ca/data/repositories/local/data_local_heroe_repository.dart';
import 'package:plantilla_ca/data/repositories/mock/data_mock_heroe_repository.dart';
import 'package:plantilla_ca/domain/entities/example.dart';
import 'package:plantilla_ca/domain/entities/heroe.dart';
import 'package:plantilla_ca/domain/usecases/get_heroe_use_case.dart';

class HeroPageController extends Controller {
  HeroPageController(DataLocalHeroeRepository heroeRepository)
      : presenter = HeroPagePresenter(heroeRepository);

  final HeroPagePresenter presenter;
  List<Heroe>? heroes;

  @override
  void onInitState() {
    // TODO: implement onInitState
    super.onInitState();
    presenter.getHeroes();
  }

  @override
  void initListeners() {
    presenter.getHeroesOnComplete = () {};
    presenter.getHeroesOnError = (e) {};
    presenter.getHeroesOnNext = getHeroesOnNext;
  }

  void getHeroesOnNext(GetHeroeUseCaseResponse response) {
    heroes = response.heroes;
    refreshUI();
  }

  List<Widget> getHeroesWidgetList() {
    if (heroes != null) {
      return heroes!
          .map(
            (e) => Column(
              children: <Widget>[
                ListTile(
                  title: Text(e.nombre!),
                  subtitle: Text(e.poder!),
                  leading: const Icon(Icons.abc),
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(
                  thickness: 5.0,
                ),
              ],
            ),
          )
          .toList();
    }
    return <Widget>[];
  }
}
