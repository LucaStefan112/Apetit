import 'package:apetit/components/action_icon.dart';
import 'package:apetit/utils/CustomColors.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String text;
  final String icon;
  final double? iconPaddingLeft;
  final double? iconPaddingRight;
  final double? iconPaddingTop;
  final double? iconPaddingBottom;
  final Function() onPressed;

  const LongButton({Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.iconPaddingLeft = 5,
    this.iconPaddingRight = 5,
    this.iconPaddingTop = 5,
    this.iconPaddingBottom = 5
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.09,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: CustomColors.secondary,
              offset: Offset(0, 1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ActionIcon(
              onClick: () => onPressed(),
              iconPath: icon,
              paddingLeft: iconPaddingLeft,
              paddingRight: iconPaddingRight,
              paddingTop: iconPaddingTop,
              paddingBottom: iconPaddingBottom,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}