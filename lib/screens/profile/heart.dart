import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/theme.dart';

class Heart extends StatefulWidget {
  const Heart({required this.character, super.key});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late Animation _animationSize;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 200));

    _animationSize = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 40), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 40, end: 25), weight: 50),
    ]).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => IconButton(
        icon: Icon(
          Icons.favorite,
          size: _animationSize.value,
        ),
        onPressed: () {
          setState(() {
            _animationController.reset();
            _animationController.forward();
            widget.character.toggleFav();
          });
        },
        color:
            widget.character.isFav ? AppColors.primaryColor : Colors.grey[800],
      ),
    );
  }
}
