import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:plantilla_ca/domain/entities/example.dart';
import 'package:plantilla_ca/domain/entities/heroe.dart';
import 'package:plantilla_ca/domain/repositories/heroe_repository.dart';

class GetHeroeUseCase extends UseCase<GetHeroeUseCaseResponse, void> {
  GetHeroeUseCase(this.heroeRepository);
  final HeroeRepository heroeRepository;

  @override
  Future<Stream<GetHeroeUseCaseResponse?>> buildUseCaseStream(
      void params) async {
    final controller = StreamController<GetHeroeUseCaseResponse>();

    try {
      final List<Heroe> heroes = await heroeRepository.getHeroes();
      controller.add(GetHeroeUseCaseResponse(heroes));
      logger.finest('GetHeroeUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetHeroeUseCase unsuccessful.');
      controller.addError(e);
    }

    return controller.stream;
  }
}

class GetHeroeUseCaseResponse {
  final List<Heroe> heroes;
  GetHeroeUseCaseResponse(this.heroes);
}
