import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/theme.dart';

class Heart extends StatefulWidget {
  const Heart({required this.character, super.key});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  late Animation _animationSize;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.favorite),
      onPressed: () {
        setState(() {
          widget.character.toggleFav();
        });
      },
      color: widget.character.isFav ? AppColors.primaryColor : Colors.grey[800],
    );
  }
}
