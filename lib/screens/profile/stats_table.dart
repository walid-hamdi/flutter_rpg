import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable({required this.character, super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.stars,
                  color:
                      widget.character.points > 0 ? Colors.yellow : Colors.grey,
                ),
                const SizedBox(
                  width: 20,
                ),
                const StyledText('Stat points available'),
                const Expanded(
                    child: SizedBox(
                  width: 20,
                )),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),
          Table(
            children: widget.character.statsAsFormattedMap.map((stats) {
              return TableRow(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryAccent.withOpacity(0.5),
                  ),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(stats['title']!),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(stats['value']!),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.character.increaseStat(stats['title']!);
                            });
                          },
                          icon: const Icon(Icons.arrow_upward),
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.character.decreaseStat(stats['title']!);
                            });
                          },
                          icon: const Icon(Icons.arrow_downward),
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ]);
            }).toList(),
          )
        ],
      ),
    );
  }
}
