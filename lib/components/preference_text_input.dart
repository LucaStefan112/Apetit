import 'package:flutter/material.dart';

import '../utils/CustomColors.dart';

class PreferencesTextInput extends StatelessWidget {
  final String label1;
  final String label2;
  final String defaultValue;
  final Function() onChanged;

  const PreferencesTextInput({Key? key, required this.label1, required this.label2, required this.defaultValue, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.94 * MediaQuery.of(context).size.width,
      height: 0.085 * MediaQuery.of(context).size.height,
      child: Row (
        children: [
          SizedBox(
            width: 0.27 * MediaQuery.of(context).size.width,
            child: Text(
              label1,
              style: const TextStyle(
                  color: CustomColors.background,
                  fontSize: 27
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
              controller: TextEditingController(text: defaultValue),
              textAlign: TextAlign.center,
              onChanged: (value) => onChanged(),
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
            label2,
            style: const TextStyle(
                color: CustomColors.background,
                fontSize: 27
            ),
          ),
        ],
      ),

    );
  }
}