import 'package:flutter/material.dart';
import 'package:flutter_rpg/theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
