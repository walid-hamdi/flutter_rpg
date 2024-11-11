import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> strings = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledText("Your Character"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: strings.length,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      color: AppColors.primaryAccent,
                      child: StyledText(strings[index]),
                    );
                  }),
            ),
            // const StyledText("Character List"),
            // const StyledHeading("Character List"),
            // const StyledTitle("Character List"),
            StyledButton(
              onPressed: () {},
              child: const StyledHeading("Create New"),
            )
          ],
        ),
      ),
    );
  }
}
