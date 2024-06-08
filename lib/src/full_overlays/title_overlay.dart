import 'package:flutter/material.dart';

class TitleOverlay extends StatelessWidget {
  final String title;
  final int textColorHex;
  final String font;
  final double fontSize;
  final int overlayColorHex;
  final MainAxisAlignment alignment;
  final double defaultPadding;
  final double opacity;

  const TitleOverlay({
    this.textColorHex = 0xFFFFFFFF,
    this.fontSize = 24,
    this.font = "Helvetica", // TODO: change default font
    this.alignment = MainAxisAlignment
        .center, // Recommended options: .end, .start, and .center
    this.defaultPadding = 10,
    this.opacity = 0.6,
    this.overlayColorHex = 0xFF000000,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(overlayColorHex).withOpacity(opacity),
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              color: Color(textColorHex),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
