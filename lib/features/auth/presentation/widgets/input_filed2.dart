import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFiled2 extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final bool? readOnly;
  final bool? obsecuretext;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final void Function()? onTap;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool enabled;
  final bool applyFormatters;
  final bool showLabel;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final double? borderRadius;
  final Color? defaultColor;

  const InputFiled2({
    Key? key,
    required this.title,
    this.hintText,
    this.helperText,
    this.initialValue,
    this.onChanged,
    this.obsecuretext,
    this.onSubmit,
    this.inputType,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.borderRadius,
    this.maxLength,
    this.focusNode,
    this.enabled = true,
    this.applyFormatters = true,
    this.showLabel = true,
    this.prefixIcon,
    this.prefixWidget,
    this.readOnly,
    this.inputFormatters,
    this.suffixWidget,
    this.labelText,
    this.onTap,
    this.defaultColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      textCapitalization: applyFormatters
          ? TextCapitalization.characters
          : TextCapitalization.none,
      decoration: InputDecoration(
        prefix: prefixWidget,
        hintText: hintText,
        labelStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color:  Colors.grey[800]),
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: defaultColor ?? Colors.grey[800]),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: defaultColor ?? Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: defaultColor ?? Colors.grey),
        ),
        labelText: labelText,
        enabled: readOnly ?? true,
        fillColor: readOnly == true
            ? const Color.fromARGB(255, 136, 142, 146)
            : Colors.white,
        contentPadding: const EdgeInsets.all(16.0),
        counter: const SizedBox(width: 0, height: 0),
        helperText: helperText,
        helperMaxLines: 2,
        prefixIcon: prefixIcon,
        suffixIcon: suffixWidget,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      keyboardType: inputType ?? TextInputType.text,
      autocorrect: false,
      maxLength: maxLength,
      obscureText: obsecuretext ?? false,
      readOnly: readOnly ?? false,
      minLines: minLines,
      maxLines: maxLines,
      inputFormatters: inputFormatters ?? [],
      textInputAction: TextInputAction.done,
    );
  }
}
