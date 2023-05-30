import 'package:plantilla_ca/domain/entities/heroe.dart';

abstract class HeroeRepository {
  Future<List<Heroe>> getHeroes();
}
