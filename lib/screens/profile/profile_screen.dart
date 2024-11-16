import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: AppColors.secondaryAccent,
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledHeading(character.vocation.title),
                      StyledText(character.vocation.description)
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Icon(
                Icons.code,
                color: AppColors.primaryColor,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: AppColors.secondaryColor.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StyledHeading('Slogan'),
                      StyledText(character.slogan),
                      const SizedBox(
                        height: 10,
                      ),
                      const StyledHeading('Weapon of choice'),
                      StyledText(character.slogan),
                      const SizedBox(
                        height: 10,
                      ),
                      const StyledHeading('Unique Ability'),
                      StyledText(character.slogan),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
