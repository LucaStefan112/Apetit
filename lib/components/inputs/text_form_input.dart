import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class TextFormInput extends StatefulWidget {
  final String label;
  final Function(String) onChanged;
  final TextInputType type;
  final Function? validator;
  final String? value;

  const TextFormInput({
    Key? key,
    required this.label,
    required this.onChanged,
    this.type = TextInputType.text,
    this.validator,
    this.value,
  }) : super(key: key);

  @override
  TextFormInputState createState() => TextFormInputState();
}

class TextFormInputState extends State<TextFormInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant TextFormInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.value != null) {
      if (oldWidget.value == null || oldWidget.value!.isEmpty &&
          widget.value != null && widget.value!.length - oldWidget.value!.length > 1) {
        _controller.text = widget.value!;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.6 * MediaQuery.of(context).size.width,
      height: 0.09 * MediaQuery.of(context).size.height,
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
        validator: (value) => widget.validator != null ? widget.validator!(value!) : null,
        controller: _controller,
        obscureText: widget.type == TextInputType.visiblePassword,
        enableSuggestions: widget.type != TextInputType.visiblePassword,
        autocorrect: widget.type != TextInputType.visiblePassword,
        maxLength: 255,
        buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
        keyboardType: widget.type,
        style: const TextStyle(
          color: CustomColors.secondary,
          fontSize: 20,
        ),
        onChanged: (value) => widget.onChanged(value),
        decoration: InputDecoration(
          labelText: widget.label,
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
