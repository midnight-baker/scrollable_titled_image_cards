import 'package:flutter/material.dart';

class GradientTitleSubtitleDescriptionOverlay extends StatelessWidget {
  final int textColorHex;
  final String font;
  final String title;
  final double? titleSize;
  final String subtitle;
  final double? subtitleSize;
  final String description;
  final double? descriptionSize;
  final int overlayColorHex;
  final Alignment alignment;
  final double defaultPadding;
  final double opacity;

  const GradientTitleSubtitleDescriptionOverlay({
    this.textColorHex = 0xFFFFFFFF,
    this.font = "Helvetica", // TODO: change default font
    this.alignment = Alignment
        .bottomCenter, // Recommended options: .bottomCenter, .bottomLeft, and .bottomRight
    this.defaultPadding = 10,
    this.opacity = 0.8,
    required this.title,
    this.titleSize = 24.0,
    required this.subtitle,
    this.subtitleSize = 16.0,
    required this.description,
    this.descriptionSize = 12.0,
    this.overlayColorHex = 0xFF000000,
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
            mainAxisAlignment:
                MainAxisAlignment.end, // vertical position of text
            children: [
              Align(
                alignment: alignment, // horizontal position of text
                child: SelectableText(
                  title,
                  style: TextStyle(
                      fontSize: titleSize,
                      color: Color(textColorHex),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: alignment, // horizontal position of text
                child: SelectableText(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: subtitleSize,
                    color: Color(textColorHex),
                    fontStyle: FontStyle.italic,
                    fontFamily: font,
                  ),
                ),
              ),
              Align(
                alignment: alignment, // horizontal position of text
                child: SelectableText(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: descriptionSize,
                    color: Color(textColorHex),
                    fontWeight: FontWeight.bold,
                    fontFamily: font,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
