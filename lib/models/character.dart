import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  Character(this.id, this.name, this._vocation, this.slogan);

  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;
  final Vocation _vocation;

  bool get isFav => _isFav;

  void toggleFav() {
    _isFav = !_isFav;
  }
}
