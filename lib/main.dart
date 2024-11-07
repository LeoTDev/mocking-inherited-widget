import 'package:flutter/material.dart';
import 'package:tests_with_inherited_widgets/myinherited_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyMockableInheritedWidgetContainer(mockState: MyBusinessClass(),
      child: const MainWidget()),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final myBusinessObject = MyInheritedWidgetContainer.of(context);
    return Scaffold(
      body: Center(child: Text(myBusinessObject.aStringField)),
    );
  }
}
