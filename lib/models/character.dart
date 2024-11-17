import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  Character(
      {required this.id,
      required this.name,
      required this.vocation,
      required this.slogan});

  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;
  final Vocation vocation;
  final Set<Skill> skills = {};

  bool get isFav => _isFav;

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  void toggleFav() {
    _isFav = !_isFav;
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((skill) => skill.id),
      'stats': statsAsMap,
      'points': points,
    };
  }

  factory Character.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshort,
      SnapshotOptions? options) {
    final data = snapshort.data()!;
    Character character = Character(
      id: data['id'],
      name: data['name'],
      vocation: Vocation.values
          .firstWhere((vocation) => vocation == data['vocation']),
      slogan: data['slogan'],
    );

    for (String id in data['skills']) {
      Skill skill = character.skills.firstWhere((skill) => skill.id == id);
      character.updateSkills(skill);
    }

    if (data['isFav'] == true) character.toggleFav();

    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}
