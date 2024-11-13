import 'package:flutter_rpg/models/stats.dart';

class Character with Stats {
  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;

  Character(this.id, this.name, this.slogan);

  void toggleFav() {
    _isFav = !_isFav;
  }
}
