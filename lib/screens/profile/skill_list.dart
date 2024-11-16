import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList({required this.character, super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> skills;

  @override
  void initState() {
    super.initState();

    setState(() {
      skills = allSkills.where((skill) {
        return skill.vocation == widget.character.vocation;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          children: [
            const StyledHeading('Choice an active skill.'),
            const StyledText('Skills are unique to your vocation.'),
            const SizedBox(height: 20),
            Row(
                children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/img/skills/${skill.image}',
                  width: 70,
                ),
              );
            }).toList()),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
