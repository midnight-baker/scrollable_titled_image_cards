import 'package:flutter/material.dart';

import 'description_overlay.dart';



class ClickableOverlay extends StatefulWidget{
  final List<String> descriptionsList;
  final List<String> imagesList;
  final Axis scrollDirection;
  final MainAxisAlignment alignment;
  final double defaultPadding;
  final double opacity;
  final int textColorHex;
  final int overlayColorHex;
  final String font;
  final List<bool> isOverlayVisible;
  final int i;

  const ClickableOverlay({
    required this.descriptionsList,
    required this.imagesList,
    required this.scrollDirection,
    this.alignment = MainAxisAlignment.end,
    this.overlayColorHex = 0xFF000000,
    this.textColorHex = 0xFFFFFFFF,
    this.defaultPadding = 10,
    this.opacity = 0.6,
    this.font = "Helvetica", // TODO: change default font
    required this.isOverlayVisible,
    required this.i,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ClickableOverlay();
}


class _ClickableOverlay extends State<ClickableOverlay>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Overlay
        GestureDetector(
          onTap: () {
            setState(() {
              widget.isOverlayVisible[widget.i] = !widget.isOverlayVisible[widget.i];
            });
          },
          child: AnimatedOpacity(
            opacity: widget.isOverlayVisible[widget.i] ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: DescriptionOverlay(
              description: widget.descriptionsList[widget.i],
              font: widget.font,
              alignment: widget.alignment,
              opacity: widget.opacity,
              textColorHex: widget.textColorHex,
              overlayColorHex: widget.overlayColorHex,
            ),
          ),
        ),
      ],
    );
  }
}

/*Container(
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
                  ),*/