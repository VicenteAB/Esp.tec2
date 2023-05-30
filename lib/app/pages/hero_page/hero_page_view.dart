import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:plantilla_ca/app/pages/example/example_controller.dart';
import 'package:plantilla_ca/app/pages/hero_page/hero_page_controller.dart';
import 'package:plantilla_ca/data/repositories/local/data_local_heroe_repository.dart';
import 'package:plantilla_ca/data/repositories/mock/data_mock_example_repository.dart';
import 'package:plantilla_ca/data/repositories/mock/data_mock_heroe_repository.dart';

class HeroPagePage extends View {
  HeroPagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeroPagePageState();
}

class _HeroPagePageState extends ViewState<HeroPagePage, HeroPageController> {
  _HeroPagePageState()
      : super(HeroPageController(
            DataLocalHeroeRepository())); //Agregar controller
  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(title: const Text('HeroPage')),
      body: ControlledWidgetBuilder<HeroPageController>(
        builder: (context, controller) {
          return ListView(
            children: controller.getHeroesWidgetList(),
          );
        },
      ),
    );
  }
}
