import 'package:flutter/material.dart';

class TitleDescriptionOverlay extends StatelessWidget{
  final int textColorHex;
  final String font;
  final String title;
  final double? titleSize;
  final String description;
  final double? descriptionSize;
  final int overlayColorHex;
  final MainAxisAlignment alignment;
  final double defaultPadding;
  final double opacity;

  const TitleDescriptionOverlay({
    this.textColorHex = 0xFFFFFFFF,
    this.font = "Helvetica", // TODO: change default font
    this.alignment = MainAxisAlignment.end, // Recommended options: .end, .start, and .center
    this.defaultPadding = 10,
    this.opacity = 0.6,
    required this.title,
    this.titleSize = 16.0,
    required this.description,
    this.descriptionSize = 12.0,
    this.overlayColorHex = 0xFF000000,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      color: Color(overlayColorHex).withOpacity(opacity),
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Column(
          mainAxisAlignment: alignment,
          children: [
            SelectableText(
              title,
              style: TextStyle(
                fontSize: titleSize,
                color: Color(textColorHex),
                fontWeight: FontWeight.bold,
                fontFamily: font,
              ),
            ),
            SelectableText(
              description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: descriptionSize,
                color: Color(textColorHex),
                fontWeight: FontWeight.bold,
                fontFamily: font,
              ),
            ),
          ],
        ),
      ),
    );
  }
}