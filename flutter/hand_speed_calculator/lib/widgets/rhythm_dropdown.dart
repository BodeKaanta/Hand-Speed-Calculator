import 'package:flutter/material.dart';
import 'package:hand_speed_calculator/logic/rhythm_type.dart';

class RhythmDropdown extends StatelessWidget{
  final String label;
  final RhythmType value;
  final ValueChanged<RhythmType> onChanged;
  final bool isDotted;
  final ValueChanged<bool> onDottedChanged;

  const RhythmDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.isDotted,
    required this.onDottedChanged,
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
        Row(
          children: [
            Expanded(
              child: DropdownButton<RhythmType>(
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
            ),
            const SizedBox(width: 8),
            InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () => onDottedChanged(!isDotted),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: isDotted,
                    onChanged: (checked) => onDottedChanged(checked ?? false),
                  ),
                  const Text('Dotted'),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ],
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