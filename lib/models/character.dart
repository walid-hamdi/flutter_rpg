class Character {
  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;

  Character(this.id, this.name, this.slogan);

  void toggleFav() {
    _isFav = !_isFav;
  }
}
