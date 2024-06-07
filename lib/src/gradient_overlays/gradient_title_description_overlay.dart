import 'package:flutter/material.dart';




class GradientTitleDescriptionOverlay extends StatelessWidget{
  final String title;
  final String description;
  final int textColorHex;
  final String font;
  final double fontSize;
  final int overlayColorHex;
  final Alignment alignment;
  final double defaultPadding;
  final double opacity;

  const GradientTitleDescriptionOverlay({
    this.textColorHex = 0xFFFFFFFF,
    this.fontSize = 24,
    this.font = "Helvetica", // TODO: change default font
    this.alignment = Alignment.bottomCenter, // Recommended options: .bottomLeft, .bottomCenter, and .bottomRight
    this.defaultPadding = 10,
    this.opacity = 0.8,
    this.overlayColorHex = 0xFF000000,
    required this.title,
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
          child: Column(
            children: [
              Align(
                alignment: alignment,
                child: SelectableText(
                  title,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Color(textColorHex),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: alignment,
                child: SelectableText(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Color(textColorHex),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}