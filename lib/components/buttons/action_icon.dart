import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final Function onClick;
  final double? size;
  final Color color;
  final bool? withShadow;
  final double? padding;
  IconData icon;

  ActionIcon({Key? key,
    required this.onClick,
    this.size = 50,
    required this.color,
    this.withShadow = false,
    this.padding = 0.1,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onClick(),
      child: Container(
        padding: EdgeInsets.all(size! * padding!),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: withShadow! ? const [
            BoxShadow(
              color: CustomColors.secondary,
              offset: Offset(0, 0),
              blurRadius: 10,
            ),
          ] : [],
        ),
        child: Icon(
          icon,
          color: color,
          size: size! * 0.5,
        ),
      ),
    );
  }
}