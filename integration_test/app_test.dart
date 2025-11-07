import 'package:backingsnap/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'app shows welcome message and can load tracks',
    ($) async {
      await $.pumpWidgetAndSettle(const App());

      // Verify initial state
      expect($(Text), findsWidgets);
      expect($('Welcome to BackingSnap'), findsOneWidget);

      // Tap the floating action button to load tracks
      await $(FloatingActionButton).tap();
      await $.pumpAndSettle();

      // Verify tracks loaded message appears
      expect($('Tracks loaded successfully!'), findsOneWidget);
    },
  );
}
