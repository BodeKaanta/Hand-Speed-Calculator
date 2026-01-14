import 'package:flutter/material.dart';

class BpmInput extends StatelessWidget{
  final double bpm;
  final ValueChanged<double> onChanged;

  const BpmInput({
    Key? key,
    required this.bpm,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Inital BPM',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter BPM'
          ),
          onChanged: (value) {
            final parsed = double.tryParse(value);
            if (parsed != null) {
              onChanged(parsed);
            }
          },
        )
      ],
    );
  }
}