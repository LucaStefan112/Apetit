import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class PreferencesTextInput extends StatefulWidget {
  final String label1;
  final String label2;
  final String? value;
  final Function(String) onChanged;

  const PreferencesTextInput({
    Key? key,
    required this.label1,
    required this.label2,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PreferencesTextInputState createState() => _PreferencesTextInputState();
}

class _PreferencesTextInputState extends State<PreferencesTextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant PreferencesTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value == null || oldWidget.value!.isEmpty &&
        widget.value != null && widget.value!.length - oldWidget.value!.length > 1) {
      _controller.text = widget.value!;
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
      width: 0.94 * MediaQuery.of(context).size.width,
      height: 0.085 * MediaQuery.of(context).size.height,
      child: Row(
        children: [
          SizedBox(
            width: 0.27 * MediaQuery.of(context).size.width,
            child: Text(
              widget.label1,
              style: const TextStyle(
                color: CustomColors.background,
                fontSize: 27,
              ),
            ),
          ),
          Container(
            width: 0.47 * MediaQuery.of(context).size.width,
            height: 0.055 * MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(
              bottom: 0.01 * MediaQuery.of(context).size.height,
              left: 0.02 * MediaQuery.of(context).size.width,
              right: 0.02 * MediaQuery.of(context).size.width,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: CustomColors.background,
                  width: 2,
                ),
              ),
            ),
            child: TextField(
              style: const TextStyle(
                color: CustomColors.background,
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
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
          ),
          Text(
            widget.label2,
            style: const TextStyle(
              color: CustomColors.background,
              fontSize: 27,
            ),
          ),
        ],
      ),
    );
  }
}
