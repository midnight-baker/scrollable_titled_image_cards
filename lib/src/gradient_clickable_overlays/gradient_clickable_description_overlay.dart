import 'package:flutter/material.dart';


class GradientClickableTitleDescriptionOverlay extends StatefulWidget {
  final int textColorHex;
  final String font;
  final String description;
  final double? descriptionSize;
  final int overlayColorHex;
  final Alignment alignment;
  final double defaultPadding;
  final double opacity;
  final List<bool> isOverlayVisible;
  final int i;

  const GradientClickableTitleDescriptionOverlay({
    this.textColorHex = 0xFFFFFFFF,
    this.font = "Helvetica", // TODO: change default font
    this.alignment = Alignment.bottomCenter, // Recommended options: .bottomCenter, .bottomLeft, and .bottomRight
    this.defaultPadding = 10,
    this.opacity = 0.8,
    required this.description,
    this.descriptionSize = 12.0,
    this.overlayColorHex = 0xFF000000,
    required this.isOverlayVisible,
    required this.i,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _GradientClickableTitleDescriptionOverlay();
}

class _GradientClickableTitleDescriptionOverlay extends State<GradientClickableTitleDescriptionOverlay>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.isOverlayVisible[widget.i] = !widget.isOverlayVisible[widget.i];
            });
          },
          child: AnimatedOpacity(
            opacity: widget.isOverlayVisible[widget.i] ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color(widget.overlayColorHex).withOpacity(widget.opacity)
                        ],
                        stops: const [0.5, 0.9],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                SelectableText(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.descriptionSize,
                    color: Color(widget.textColorHex),
                    fontWeight: FontWeight.bold,
                    fontFamily: widget.font,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}