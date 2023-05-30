import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:plantilla_ca/domain/entities/heroe.dart';
import 'package:plantilla_ca/domain/repositories/heroe_repository.dart';

class DataLocalHeroeRepository implements HeroeRepository {
  factory DataLocalHeroeRepository() => _instance;
  Logger _logger;

  static final DataLocalHeroeRepository _instance =
      DataLocalHeroeRepository._internal();

  DataLocalHeroeRepository._internal()
      : _logger = Logger('DataLocalHeroeRepository');

  @override
  Future<List<Heroe>> getHeroes() async {
    try {
      List<Heroe> heroesList = <Heroe>[];

      final String heroesFile =
          await rootBundle.loadString('assets/json/heroes.json');

      Map<String, dynamic> heroesMap = jsonDecode(heroesFile);

      List<dynamic> heroesObjectList = heroesMap['heroes'];

      heroesList =
          heroesObjectList.map((heroe) => Heroe.fromJson(heroe)).toList();
      _logger.finest('DataLocalHeroeRepository successful.');

      return heroesList;
    } catch (e) {
      _logger.severe('DataLocalHeroeRepository unsuccessful.');
      rethrow;
    }
  }
}
