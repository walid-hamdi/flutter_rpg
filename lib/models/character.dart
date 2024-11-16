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
}
