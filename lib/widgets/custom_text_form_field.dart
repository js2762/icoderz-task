import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final InputBorder? focusedBorder, enabledBorder, errorBorder;
  final InputDecoration? decoration;
  final Widget? prefixIcon, suffixIcon;
  final String? hintText;
  final Color? fillColor, cursorColor, borderColor;
  final bool? filled, obscureText, readOnly;
  final TextStyle? textStyle, hintStyle;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final BorderRadius? borderRadiusAll;
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  const CustomTextFormField(
      {super.key,
      this.hintText,
      required this.controller,
      this.focusNode,
      this.onTapOutside,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.decoration,
      this.fillColor,
      this.filled,
      this.cursorColor,
      this.borderColor,
      this.textStyle,
      this.hintStyle,
      this.obscureText,
      this.keyboardType,
      this.validator,
      this.onSaved,
      this.onFieldSubmitted,
      this.autoValidateMode,
      this.maxLines,
      this.maxLength,
      this.textInputAction,
      this.borderRadiusAll,
      this.contentInsertionConfiguration,
      this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      minLines: null,
      onTapOutside: onTapOutside,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      readOnly: readOnly ?? false,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: cursorColor ?? Colors.black,
      style: textStyle ??
          const TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            decorationThickness: 0,
          ),
      keyboardType: keyboardType,
      autovalidateMode: autoValidateMode,
      textInputAction: textInputAction,

      obscureText: obscureText ?? false,
      contentInsertionConfiguration: contentInsertionConfiguration,

      maxLines: maxLines ?? (obscureText ?? false ? 1 : null),
      // Allow unlimited number of lines for multiline input
      decoration: decoration ??
          InputDecoration(
            // contentPadding: EdgeInsets.all(8.0),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: borderColor ?? Colors.white, width: 1),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: borderColor ?? Colors.white, width: 1),
                ),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                  borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: borderColor ?? Colors.red, width: 1),
                ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: borderColor ?? Colors.red, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadiusAll ?? const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: borderColor ?? Colors.red, width: 1),
            ),
            errorMaxLines: 2,

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            // errorStyle: poppinsTextStyle.copyWith(fontSize: 10, color: AppColors.errorColor),
            hintText: hintText,
            hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
            fillColor: fillColor,
            filled: filled ?? true,
          ),
    );
  }
}
