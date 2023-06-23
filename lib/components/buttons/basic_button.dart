import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const BasicButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        width: MediaQuery.of(context).size.width * 0.37,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomColors.background,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: CustomColors.secondary,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}