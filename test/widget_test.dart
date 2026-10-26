import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce2/main.dart';

void main() {
  testWidgets('WizoApp renders home screen with store branding and products', (
    WidgetTester tester,
  ) async {
    // Set a consistent screen size for testing responsive layouts
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.5;

    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Build the app
    await tester.pumpWidget(const WizoApp());
    await tester.pumpAndSettle();

    // Verify brand title is visible
    expect(find.text('Wizo'), findsOneWidget);

    // Verify search input is present
    expect(find.byType(TextField), findsOneWidget);

    // Verify section titles are present
    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('Featured products'), findsOneWidget);

    // Verify category items are loaded
    expect(find.text('Foods'), findsOneWidget);
    expect(find.text('Gadget'), findsOneWidget);

    // Verify product cards are loaded
    expect(find.text('Sneaker'), findsOneWidget);
  });
}
