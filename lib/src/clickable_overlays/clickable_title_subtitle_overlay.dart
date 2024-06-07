import 'package:flutter/material.dart';
import 'package:scrollable_titled_image_cards/src/full_overlays/title_subtitle_overlay.dart';



class ClickableTitleSubtitleOverlay extends StatefulWidget{
  final List<String> titlesList;
  final List<String> subtitlesList;
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

  const ClickableTitleSubtitleOverlay({
    required this.titlesList,
    required this.subtitlesList,
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
  State<StatefulWidget> createState() => _ClickableTitleSubtitleOverlay();
}


class _ClickableTitleSubtitleOverlay extends State<ClickableTitleSubtitleOverlay>{
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
            child: TitleSubtitleOverlay(
              title: widget.titlesList[widget.i],
              subtitle: widget.subtitlesList[widget.i],
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