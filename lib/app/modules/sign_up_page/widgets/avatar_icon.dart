import 'package:flutter/material.dart';

class AvatarIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final double size;
  final double iconSize;

  const AvatarIcon({
    super.key,
    required this.icon,
    required this.backgroundColor,
    this.size = 80,
    this.iconSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}