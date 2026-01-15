import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final double? resultBpm;

  const ResultDisplay({
    Key? key,
    required this.resultBpm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (resultBpm == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Result',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${resultBpm!.toStringAsFixed(1)} BPM',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}