import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? childWidget;
  final EdgeInsetsGeometry? padding, margin;
  final Color? bgColor;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    this.onPressed,
    this.childWidget,
    this.padding,
    this.margin,
    this.bgColor,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            overlayColor: Colors.black,
            padding: padding ?? const EdgeInsets.only(left: 20, right: 20),
            backgroundColor: bgColor ?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            textStyle: textStyle),
        onPressed: onPressed,
        child: childWidget,
      ),
    );
  }
}
