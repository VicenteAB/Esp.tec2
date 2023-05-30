import 'package:logging/logging.dart';
import 'package:plantilla_ca/domain/entities/example.dart';
import 'package:plantilla_ca/domain/entities/heroe.dart';
import 'package:plantilla_ca/domain/repositories/heroe_repository.dart';

class DataMockHeroeRepository implements HeroeRepository {
  factory DataMockHeroeRepository() => _instance;
  Logger _logger;

  static final DataMockHeroeRepository _instance =
      DataMockHeroeRepository._internal();

  DataMockHeroeRepository._internal()
      : _logger = Logger('DataMockHeroeRepository');

  @override
  Future<List<Heroe>> getHeroes() async {
    try {
      List<Heroe> heroesList = <Heroe>[];
      _logger.finest('DataMockHeroeRepository successful.');

      //Add en cascada
      heroesList
        ..add(
          Heroe(
            nombre: 'Superman',
            poder: 'Todos',
            icon: 'accessibility_new',
            color: '#3498db',
          ),
        )
        ..add(
          Heroe(
            nombre: 'Spiderman',
            poder: 'Sentido Arácnido',
            icon: 'ac_unit',
            color: '#e74c3c',
          ),
        )
        ..add(
          Heroe(
            nombre: 'Ironman',
            poder: 'Armadura y tecnología',
            icon: 'android',
            color: '#c0392b',
          ),
        )
        ..add(
          Heroe(
            nombre: 'Wolverine',
            poder: 'Regeneración',
            icon: 'healing',
            color: '#f1c40f',
          ),
        );
      return heroesList;
    } catch (e) {
      _logger.severe('DataMockHeroeRepository unsuccessful.');
      rethrow;
    }
  }
}
