import 'package:dynamic_animated_gif/color_notifier.dart';
import 'package:flutter/material.dart';

class ColorInheritedWidget extends InheritedWidget {
  const ColorInheritedWidget({
    super.key,
    required super.child,
    required this.colorNotifier,
  });

  final ColorNotifier colorNotifier;

  static ColorInheritedWidget of(BuildContext context) {
    final ColorInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<ColorInheritedWidget>();
    assert(result != null, 'No MyInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ColorInheritedWidget old) {
    return old.colorNotifier.secondaryColor != colorNotifier.secondaryColor
        || old.colorNotifier.primaryColor != colorNotifier.primaryColor;
  }
}
