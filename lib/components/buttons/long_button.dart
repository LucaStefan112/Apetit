import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/material.dart';

import 'action_icon.dart';

class LongButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;

  const LongButton({Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
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
                icon: icon,
                onClick: () {},
                color: CustomColors.secondary,
                padding: 0.1,
                size: MediaQuery.of(context).size.width * 0.16,
                withShadow: false
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