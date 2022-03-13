import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habllen/shared/widgets/custom_add_field.dart';

main() {
  testWidgets('CustomAddField has a value when supplied with a value',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomAddField(
            value: 'test',
            fieldName: "test_field",
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('test'), findsOneWidget);
    expect(find.byIcon(Icons.add_circle_outline_rounded), findsNothing);
    await tester.tap(find.byType(InkWell));
    await tester.pump();
    await tester.enterText(find.byKey(Key("dialog_text_field")), 'test2');
    await tester.pumpAndSettle();
    expect(find.text('test2'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('test2'), findsOneWidget);
  });

  testWidgets('CustomAddField without value shows add icon', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomAddField(
            fieldName: "test_field",
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('test'), findsNothing);
    expect(find.byIcon(Icons.add_circle_outline_rounded), findsOneWidget);
    await tester.tap(find.byType(InkWell));
    await tester.pump();
    await tester.enterText(find.byKey(Key("dialog_text_field")), 'test2');
    await tester.pumpAndSettle();
    expect(find.text('test2'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('test2'), findsOneWidget);
  });
}
