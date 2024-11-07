import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tests_with_inherited_widgets/main.dart';
import 'package:tests_with_inherited_widgets/myinherited_widget.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    final mockedBusinessObject = MyBusinessClass();
    mockedBusinessObject.aStringField = "hola";

    await tester.pumpWidget(MaterialApp(
        home: MyMockableInheritedWidgetContainer(
      mockState: mockedBusinessObject,
      child: const MainWidget(),
    )));
    expect(find.text('hola'), findsOneWidget);
  });
}
