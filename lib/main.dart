import 'dart:math';

import 'package:dynamic_animated_gif/color_inherited_widget.dart';
import 'package:dynamic_animated_gif/color_notifier.dart';
import 'package:dynamic_animated_gif/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const Color _overlayColor = Color(0x66636363);
  final _colorNotifier = ColorNotifier();
  late Color _primaryColor = _colorNotifier.primaryColor;
  late Color _secondaryColor = _colorNotifier.secondaryColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorNotifier.addListener((){
      _primaryColor = _colorNotifier.primaryColor;
      _secondaryColor = _colorNotifier.secondaryColor;
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return ColorInheritedWidget(
      colorNotifier: _colorNotifier,
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayColor: _overlayColor,
        overlayOpacity: 1,
        overlayWidget: Center(
          child: LoaderWidget(
            primaryColor: _primaryColor,
            secondaryColor: _secondaryColor,
          ),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: _HomeScreen(),
        ),
      ),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen();

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                  onPressed: () async {
                    final overlay = context.loaderOverlay;
                    overlay.show();
                    await Future.delayed(Duration(seconds: 5));
                    if (mounted) {
                      overlay.hide();
                    }
                  },
                  child: Text('Show loader'),
            ),
            ElevatedButton(onPressed: () {
              final primaryColor = _getRandomColor();
              final secondaryColor = _getRandomColor();
              ColorInheritedWidget.of(context).colorNotifier
                ..updatePrimaryColor(primaryColor)
                ..updateSecondaryColor(secondaryColor);
            },
              child: Text('Update Colors'),),
          ],
        ),
      ),
    );
  }

  Color _getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}