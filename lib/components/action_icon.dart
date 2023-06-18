import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final Function onClick;
  final String iconPath;
  final double? size;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final bool? withShadow;

  const ActionIcon({Key? key,
    required this.onClick,
    required this.iconPath,
    this.size = 50,
    this.paddingLeft = 5,
    this.paddingRight = 5,
    this.paddingTop = 5,
    this.paddingBottom = 5,
    this.withShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onClick(),
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.only(
          left: paddingLeft!,
          right: paddingRight!,
          top: paddingTop!,
          bottom: paddingBottom!,
        ),
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
        child: Image(
          image: AssetImage(iconPath),
        ),
      ),
    );
  }
}