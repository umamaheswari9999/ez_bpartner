import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.maxLength,
    this.obsecuretext,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text, this.formmater,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? formmater;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool? obsecuretext;
  final VoidCallback? onTap;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecuretext ?? false,
      onTap: onTap,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.blueGrey,
        suffixIcon: suffixIcon,
        counter: null,
        counterText: '',
      ),
      inputFormatters: formmater,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      autocorrect: false,
      keyboardType: textInputType,
      controller: controller,
      readOnly: readOnly,
      textInputAction: TextInputAction.next,
      maxLength: maxLength,
    );
  }
}
