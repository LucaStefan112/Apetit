import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class GenerateRecipeTextField extends StatefulWidget {
  final String? initialValue;
  final Function(String) onChanged;

  const GenerateRecipeTextField({
    Key? key,
    this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  GenerateRecipeTextFieldState createState() => GenerateRecipeTextFieldState();
}

class GenerateRecipeTextFieldState extends State<GenerateRecipeTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant GenerateRecipeTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue == null || oldWidget.initialValue!.isEmpty &&
        widget.initialValue != null && widget.initialValue!.length - oldWidget.initialValue!.length > 1) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .05,
      child: TextField(
        style: const TextStyle(
          color: CustomColors.white,
          fontSize: 23,
          fontWeight: FontWeight.w700,
        ),
        maxLength: 30,
        autofocus: true,
        controller: _controller,
        textAlign: TextAlign.center,
        onChanged: (value) => widget.onChanged(value),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
        ),
      ),
    );
  }
}