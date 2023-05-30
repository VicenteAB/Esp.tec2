import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:plantilla_ca/app/pages/example/example_controller.dart';
import 'package:plantilla_ca/data/repositories/mock/data_mock_example_repository.dart';

class ExamplePage extends View {
  ExamplePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExamplePageState();
}

class _ExamplePageState extends ViewState<ExamplePage, ExampleController> {
  _ExamplePageState()
      : super(ExampleController(
            DataMockExampleRepository())); //Agregar controller
  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(title: Text('Hola Clean architecture')),
      body: ControlledWidgetBuilder<ExampleController>(
        builder: (context, controller) {
          return Center(
            child: Text(controller.example!.greeting ?? ''),
          );
        },
      ),
      floatingActionButton: ControlledWidgetBuilder<ExampleController>(
          builder: (context, controller) {
        return FloatingActionButton(
          child: const Icon(Icons.arrow_right),
          onPressed: () {
            controller.goHeroesPage();
          },
        );
      }),
    );
  }
}
