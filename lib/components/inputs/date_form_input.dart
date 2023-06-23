import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class DateFormInput extends StatefulWidget {
  final String label;
  final Function(String) onChanged;
  final TextInputType type;
  final Function? validator;
  final String? value;

  const DateFormInput({
    Key? key,
    required this.label,
    required this.onChanged,
    this.type = TextInputType.text,
    this.validator,
    this.value
  }) : super(key: key);

  @override
  _DateFormInputState createState() => _DateFormInputState();
}

class _DateFormInputState extends State<DateFormInput> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateInput.text = widget.value ?? '';
  }

  @override
  void didUpdateWidget(covariant DateFormInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.value != null) {
      dateInput.text = widget.value!.substring(0, 10);
    }
  }

  @override
  void dispose() {
    dateInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.6 * MediaQuery.of(context).size.width,
      height: 0.085 * MediaQuery.of(context).size.height,
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
          horizontal: 0.024 * MediaQuery.of(context).size.width
      ),
      child: TextFormField(
        validator: (value) => widget.validator != null ? widget.validator!(value!) : null,
        readOnly: true,
        controller: dateInput,
        obscureText: widget.type == TextInputType.visiblePassword,
        enableSuggestions: widget.type != TextInputType.visiblePassword,
        autocorrect: widget.type != TextInputType.visiblePassword,
        keyboardType: widget.type,
        style: const TextStyle(
          color: CustomColors.secondary,
          fontSize: 20,
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null) {
            String formattedDate = pickedDate.toString().substring(0, 10);
            dateInput.text = formattedDate;
            widget.onChanged(formattedDate);
          }
        },
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
