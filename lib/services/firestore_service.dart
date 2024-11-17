import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection('character')
      .withConverter(
          fromFirestore: Character.fromFirestore,
          toFirestore: (Character character, _) => character.toFirestore());

  static addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  static Future<QuerySnapshot<Character>> getCharacters() async {
    return await ref.get();
  }

  static updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsAsMap,
      'points': character.points,
      // '': character.name,
      'isFav': character.isFav,
      'skills': character.skills.map((skill) => skill.id),
      // '': character.slogan,
      // '': character.vocation
    });
  }
}
