import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:plantilla_ca/app/pages.dart';
import 'package:plantilla_ca/app/pages/example/example_presenter.dart';
import 'package:plantilla_ca/data/repositories/mock/data_mock_example_repository.dart';
import 'package:plantilla_ca/domain/entities/example.dart';
import 'package:plantilla_ca/domain/usecases/get_example_use_case.dart';

class ExampleController extends Controller {
  ExampleController(DataMockExampleRepository exampleRepository)
      : presenter = ExamplePresenter(exampleRepository);

  final ExamplePresenter presenter;
  Example? example = Example(greeting: '');

  @override
  void onInitState() {
    // TODO: implement onInitState
    super.onInitState();
    presenter.getGreeting('Hola');
  }

  @override
  void initListeners() {
    presenter.getGreetingOnComplete = () {};
    presenter.getGreetingOnError = (e) {};
    presenter.getGreetingOnNext = getGreetingOnNext;
  }

  void getGreetingOnNext(GetExampleUseCaseResponse response) {
    example = response.example;
    refreshUI();
  }

  void goHeroesPage() {
    Map args = <String, dynamic>{};
    Navigator.pushNamed(
      getContext(),
      Pages.heroesPage,
      arguments: args,
    );
  }
}
