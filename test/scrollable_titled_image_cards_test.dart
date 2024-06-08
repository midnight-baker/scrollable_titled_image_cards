import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scrollable_titled_image_cards/scrollable_titled_image_cards.dart';

void main() {
  const images = [
    'example/assets/images/colosseum.jpg',
    'example/assets/images/florence.jpg',
  ];

  group('ScrollableTitledImageCards widget tests', () {
    testWidgets('Renders ScrollableTitledImageCards widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableTitledImageCards(
            imagesList: [images[0], images[1]],
          ),
        ),
      );

      expect(find.byType(ScrollableTitledImageCards), findsOneWidget);

      expect(find.byType(Image), findsNWidgets(2));
    });
  });
}
