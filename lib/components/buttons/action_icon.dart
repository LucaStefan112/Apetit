import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class ActionIcon extends StatefulWidget {
  final Function onClick;
  final double? size;
  final Color color;
  final bool? withShadow;
  final double? padding;
  final IconData icon;

  const ActionIcon({
    Key? key,
    required this.onClick,
    this.size = 50,
    required this.color,
    this.withShadow = false,
    this.padding = 0.1,
    required this.icon,
  }) : super(key: key);

  @override
  ActionIconState createState() => ActionIconState();
}

class ActionIconState extends State<ActionIcon> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => widget.onClick(),
      child: Container(
        padding: EdgeInsets.all(widget.size! * widget.padding!),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: widget.withShadow! ? const [
            BoxShadow(
              color: CustomColors.secondary,
              offset: Offset(0, 0),
              blurRadius: 10,
            ),
          ] : [],
        ),
        child: Icon(
          widget.icon,
          color: widget.color,
          size: widget.size! * 0.5,
        ),
      ),
    );
  }
}
