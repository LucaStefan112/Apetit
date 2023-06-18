import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class PrivacyPolicy extends StatefulWidget {
  final Function(bool) onChanged;

  const PrivacyPolicy({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChanged(value);
            });
          },
          activeColor: CustomColors.secondary,
        ),
        const Text(
          'I agree to the ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Privacy Policy',
            style: TextStyle(
              color: CustomColors.secondary,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}