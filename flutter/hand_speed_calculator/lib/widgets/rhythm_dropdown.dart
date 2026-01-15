import 'package:flutter/material.dart';
import 'package:hand_speed_calculator/logic/rhythm_type.dart';

class RhythmDropdown extends StatelessWidget{
  final String label;
  final RhythmType value;
  final ValueChanged<RhythmType> onChanged;

  const RhythmDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DropdownButton<RhythmType>(
          value: value,
          isExpanded: true,
          items: RhythmType.values.map((rhythm) {
            return DropdownMenuItem<RhythmType>(
              value: rhythm,
              child: Text(_displayName(rhythm)),
            );
          }).toList(),
          onChanged: (selected) {
            if (selected != null) {
              onChanged(selected);
            }
          },
        ),
      ],
    );
  }

  String _displayName(RhythmType rhythm) {
    return rhythm.name
    .toLowerCase()
    .replaceAll('_', ' ')
    .replaceFirstMapped(
      RegExp(r'^\w'),
      (match) => match.group(0)!.toUpperCase(),
    );
  }
}