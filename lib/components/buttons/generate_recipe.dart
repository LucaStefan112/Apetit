import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class GenerateRecipeButton extends StatelessWidget {
  final Function() onPressed;

  const GenerateRecipeButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.6 * MediaQuery.of(context).size.width,
      height: 0.1 * MediaQuery.of(context).size.height,
      child: MaterialButton(
        color: CustomColors.primary,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 6,
        splashColor: CustomColors.secondary,
        onPressed: onPressed,
        child: const Text(
          'Generate Recipe!',
          style: TextStyle(
            color: CustomColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}