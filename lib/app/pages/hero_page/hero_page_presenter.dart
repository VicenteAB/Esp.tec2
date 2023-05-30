import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:plantilla_ca/domain/repositories/heroe_repository.dart';
import 'package:plantilla_ca/domain/usecases/get_heroe_use_case.dart';

class HeroPagePresenter extends Presenter {
  Function? getHeroesOnNext;
  Function? getHeroesOnError;
  Function? getHeroesOnComplete;

  GetHeroeUseCase _getHeroeUseCase;

  HeroPagePresenter(HeroeRepository heroeRepository)
      : _getHeroeUseCase = GetHeroeUseCase(heroeRepository);

  @override
  void dispose() {
    _getHeroeUseCase.dispose();
  }

  void getHeroes() {
    //llamar al observer
    _getHeroeUseCase.execute(_GetHeroeUseCaseObserver(this));
  }
}

class _GetHeroeUseCaseObserver implements Observer<GetHeroeUseCaseResponse> {
  final HeroPagePresenter presenter;
  _GetHeroeUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getHeroesOnComplete != null);
    presenter.getHeroesOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getHeroesOnError != null);
    presenter.getHeroesOnError!(e);
  }

  @override
  void onNext(GetHeroeUseCaseResponse? response) {
    assert(presenter.getHeroesOnComplete != null);
    presenter.getHeroesOnNext!(response);
  }
}
