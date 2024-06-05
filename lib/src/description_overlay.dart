import 'package:flutter/material.dart';

class DescriptionOverlay extends StatelessWidget{
  final int textColorHex;
  final String font;
  final String description;
  final double? descriptionSize;
  final int overlayColorHex;
  final MainAxisAlignment alignment;
  final double defaultPadding;
  final double opacity;

  const DescriptionOverlay({
    this.textColorHex = 0xFFFFFFFF,
    this.font = "Helvetica", // TODO: change default font
    this.alignment = MainAxisAlignment.end, // Recommended options: .end, .start, and .center
    this.defaultPadding = 10,
    this.opacity = 0.6,
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

/*Stack(
                  alignment: Alignment.center,
                  children: [
                    // Overlay
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isOverlayVisible[i] = !_isOverlayVisible[i];
                        });
                      },
                      child: AnimatedOpacity(
                        opacity: _isOverlayVisible[i] ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          color: Colors.black.withOpacity(0.3),
                          constraints: const BoxConstraints.expand(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(
                                valuesDescription[i],
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )*/