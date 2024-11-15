import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();

  final _sloganController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _sloganController.dispose();
  }

  void _handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      debugPrint('Please enter the name.');
      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      debugPrint('Please enter the slogan.');
      return;
    }

    debugPrint(
        'Name: ${_nameController.text} , slogan ${_sloganController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledHeading('Character Creation'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            Icon(
              Icons.code,
              color: AppColors.primaryColor,
            ),
            const Center(
              child: StyledHeading('Welcome, new player.'),
            ),
            const Center(
              child: StyledText('Create a name & slogan for your character.'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _nameController,
              style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
              cursorColor: AppColors.secondaryColor,
              decoration: const InputDecoration(
                label: StyledText('Character name'),
                prefixIcon: Icon(
                  Icons.person,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _sloganController,
              style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
              cursorColor: AppColors.secondaryColor,
              decoration: const InputDecoration(
                label: StyledText('Character slogan'),
                prefixIcon: Icon(
                  Icons.message,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            StyledButton(
              onPressed: _handleSubmit,
              child: const StyledHeading('create character'),
            )
          ],
        ),
      ),
    );
  }
}
