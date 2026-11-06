import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hand_speed_calculator/logic/rhythm_type.dart';
import 'package:hand_speed_calculator/widgets/rhythm_dropdown.dart';

void main() {
  testWidgets('Dotted checkbox toggles via box and label', (tester) async {
    bool dotted = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => RhythmDropdown(
              label: 'Starting Rhythm',
              value: RhythmType.QUARTER_NOTE,
              onChanged: (_) {},
              isDotted: dotted,
              onDottedChanged: (value) => setState(() => dotted = value),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Dotted'), findsOneWidget);
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isFalse);

    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(dotted, isTrue);
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);

    await tester.tap(find.text('Dotted'));
    await tester.pump();
    expect(dotted, isFalse);
  });
}
