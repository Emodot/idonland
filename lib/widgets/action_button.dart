import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.size,
    // required this.btnName,
    required this.color,
    required this.btnAction,
    required this.textWidget,
  });

  final Size size;
  // final String btnName;
  final VoidCallback btnAction;
  final Color color;
  final Widget textWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          fixedSize: Size(size.width * 0.8, size.height * 0.07),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: btnAction,
        child: textWidget,
      ),
    );
  }
}
