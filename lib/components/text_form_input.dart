import 'package:flutter/material.dart';

import '../utils/CustomColors.dart';

class TextFormInput extends StatelessWidget {
  final String label;
  final Function(String) onChanged;
  final TextInputType type;
  final Function? validator;

  const TextFormInput({Key? key,
    required this.label,
    required this.onChanged,
    this.type = TextInputType.text,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        width: 0.6 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColors.background,
          borderRadius: BorderRadius.circular(0.024 * MediaQuery.of(context).size.width),
        ),
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.symmetric(
          vertical: 0.012 * MediaQuery.of(context).size.width,
          horizontal: 0.048 * MediaQuery.of(context).size.width,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 0.024 * MediaQuery.of(context).size.width,
        ),
        child: TextFormField(
          validator: (value) => validator != null ? validator!(value!) : null,
          obscureText: type == TextInputType.visiblePassword,
          enableSuggestions: type != TextInputType.visiblePassword,
          autocorrect: type != TextInputType.visiblePassword,
          keyboardType: type,
          style: const TextStyle(
            color: CustomColors.secondary,
            fontSize: 20,
          ),
          onChanged: (value) => onChanged(value),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: CustomColors.secondary,
              fontSize: 20,
            ),
            border: InputBorder.none,
          ),
        ),
    );
  }
}