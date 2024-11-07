import 'package:flutter/material.dart';

class MyInheritedWidgetContainer extends StatefulWidget {
  final Widget child;

  const MyInheritedWidgetContainer({super.key, required this.child});

  static MyBusinessClass of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>();
    return widget!.state;
  }

  @override
  State<MyInheritedWidgetContainer> createState() =>
      _MyInheritedWidgetContainerState();
}

class _MyInheritedWidgetContainerState
    extends State<MyInheritedWidgetContainer> {
  late MyBusinessClass state;

  @override
  void initState() {
    state = MyBusinessClass();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(state: state, child: widget.child);
  }
}

class _MyInheritedWidget extends InheritedWidget {
  final MyBusinessClass state;

  const _MyInheritedWidget({
    required super.child,
    required this.state,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is _MyInheritedWidget && oldWidget.state != state;
  }
}

class MyBusinessClass {
  bool aBoolField = false;
  int anIntField = 0;
  String aStringField = "aStringField";

  MyBusinessClass();

  String aMethod() {
    return "aMethod return";
  }

  Future<String> aFutureMethod() async {
    return Future.value("aFutureMethod return");
  }
}

@visibleForTesting
class MyMockableInheritedWidgetContainer extends MyInheritedWidgetContainer {
  final MyBusinessClass mockState;

  @visibleForTesting
  const MyMockableInheritedWidgetContainer(
      {super.key, required super.child, required this.mockState});

  @override
  State<MyInheritedWidgetContainer> createState() =>
      _MyMockableInheritedWidgetContainerState();
}

class _MyMockableInheritedWidgetContainerState
    extends State<MyMockableInheritedWidgetContainer> {
  late MyBusinessClass state;

  @override
  void initState() {
    state = widget.mockState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(state: state, child: widget.child);
  }
}
