import 'package:ez_flutter/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.onChanged,
    this.onSubmit,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.maxLength,
    this.radius = 8.0,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final int? maxLength;
  final double? radius;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      initialValue: initialValue,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 8.0),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 8.0),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        contentPadding: const EdgeInsets.all(12.0),
        hintText: hintText,
        labelText: hintText?.toUpperCase() ?? '',
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.blueGrey,
        suffixIcon: suffixIcon,
        counter: const SizedBox(width: 0, height: 0),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      autocorrect: false,
      keyboardType: keyboardType,
      controller: controller,
      readOnly: readOnly,
      maxLength: maxLength,
      textInputAction: TextInputAction.next,
    );
  }
}
