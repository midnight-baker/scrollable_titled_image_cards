import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final int index;
  final Axis scrollDirection;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Function(int index)? onTap;
  final Widget overlay;
  final String img;

  const ListItem({
    required this.img,
    required this.overlay,
    required this.index,
    this.scrollDirection = Axis.vertical,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      width: width ?? (scrollDirection == Axis.vertical ? 400 : 200),
      height: height ?? (scrollDirection == Axis.vertical ? 200 : 400),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!.call(index);
            }
          },
          child: Stack(
            children: [
              _buildStaticBackground(context),
              overlay,
            ],
          ),
        ),
      ),
    );
  }

  /// uses a static background image
  Widget _buildStaticBackground(BuildContext context) {
    return (img.startsWith('http'))
        ? Image.network(
            img,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        : Image.asset(
            img,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          );
  }
}
