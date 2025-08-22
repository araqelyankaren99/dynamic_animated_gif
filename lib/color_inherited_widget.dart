import 'package:dynamic_animated_gif/color_notifier.dart';
import 'package:flutter/material.dart';

class ColorInheritedWidget extends InheritedNotifier<ColorNotifier> {
  const ColorInheritedWidget({
    super.key,
    required super.child,
    required this.colorNotifier,
  }) : super(notifier : colorNotifier);

  final ColorNotifier colorNotifier;

  static ColorInheritedWidget of(BuildContext context) {
    final ColorInheritedWidget? result =
    context.dependOnInheritedWidgetOfExactType<ColorInheritedWidget>();
    assert(result != null, 'No ColorInheritedWidget found in context');
    return result!;
  }

  static ColorNotifier? watch<T extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ColorInheritedWidget>()
        ?.colorNotifier;
  }
}
