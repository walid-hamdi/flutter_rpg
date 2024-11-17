import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    // Character(
    //     id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
    // Character(
    //     id: '2',
    //     name: 'Jonny',
    //     vocation: Vocation.junkie,
    //     slogan: 'Light me up...'),
    // Character(
    //     id: '3',
    //     name: 'Crimson',
    //     vocation: Vocation.raider,
    //     slogan: 'Fire in the hole!'),
    // Character(
    //     id: '4',
    //     name: 'Shaun',
    //     vocation: Vocation.ninja,
    //     slogan: 'Alright then gang.'),
  ];

  get characters => _characters;

  addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    debugPrint(character.toString());

    _characters.add(character);
    notifyListeners();
  }

  fetchCharacters() async {
    if (_characters.isEmpty) {
      var characters = await FirestoreService.getCharacters();

      for (var doc in characters.docs) {
        _characters.add(doc.data());
      }

      notifyListeners();
    }
  }

  saveChanges(Character character) async {
    await FirestoreService.updateCharacter(character);
    notifyListeners();
  }
}
