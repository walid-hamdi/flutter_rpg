import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

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
    return;
  }

  deleteCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }
}
