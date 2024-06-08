import 'package:flutter/material.dart';

//TODO: check this works
// __ gradient appears on click
// __ gradient appears over entire image
// __ text appears centered at bottom
// __ text appears on click

class GradientClickableTitleSubtitleOverlay extends StatefulWidget {
  final int textColorHex;
  final String font;
  final String title;
  final double? titleSize;
  final int overlayColorHex;
  final MainAxisAlignment alignment;
  final double defaultPadding;
  final double opacity;
  final List<bool> isOverlayVisible;
  final int i;

  const GradientClickableTitleSubtitleOverlay({
    this.textColorHex = 0xFFFFFFFF,
    this.font = "Helvetica", // TODO: change default font
    this.alignment = MainAxisAlignment.end, // Recommended options: .bottomCenter, .bottomLeft, and .bottomRight
    this.defaultPadding = 10,
    this.opacity = 0.8,
    required this.title,
    this.titleSize = 24.0,
    this.overlayColorHex = 0xFF000000,
    required this.isOverlayVisible,
    required this.i,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _GradientClickableTitleSubtitleOverlay();
}

class _GradientClickableTitleSubtitleOverlay extends State<GradientClickableTitleSubtitleOverlay>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.isOverlayVisible[widget.i] = !widget.isOverlayVisible[widget.i];
              });
            },
            child: AnimatedOpacity(
              opacity: widget.isOverlayVisible[widget.i] ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
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
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: widget.alignment,
                      children: [
                        SelectableText(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: widget.titleSize,
                            color: Color(widget.textColorHex),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*GestureDetector(
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
                  widget.title,
                  style: TextStyle(
                      fontSize: widget.titleSize,
                      color: Color(widget.textColorHex),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),*/