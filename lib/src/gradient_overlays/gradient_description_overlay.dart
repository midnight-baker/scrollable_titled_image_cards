import 'package:flutter/material.dart';




class GradientDescriptionOverlay extends StatelessWidget{
  final String description;
  final int textColorHex;
  final String font;
  final double fontSize;
  final int overlayColorHex;
  final Alignment alignment;
  final double defaultPadding;
  final double opacity;

  const GradientDescriptionOverlay({
    this.textColorHex = 0xFFFFFFFF,
    this.fontSize = 12,
    this.font = "Helvetica", // TODO: change default font
    this.alignment = Alignment.bottomCenter, // Recommended options: .bottomLeft, .bottomCenter, and .bottomRight
    this.defaultPadding = 10,
    this.opacity = 0.8,
    this.overlayColorHex = 0xFF000000,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color(overlayColorHex).withOpacity(opacity)
                ],
                stops: const [0.5, 0.9],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SelectableText(
            description,
            style: TextStyle(
                fontSize: fontSize,
                color: Color(textColorHex),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}