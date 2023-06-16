import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class PANInputFieldWidget extends StatefulWidget {
  const PANInputFieldWidget({
    Key? key,
    required this.title,
    this.hintText,
    this.initialValue,
    required this.onChanged,
    required this.onSubmit,
    this.inputType = TextInputType.text,
    this.isReadonly = false,
    this.controller,
    this.maxLength,
    this.prefixIcon,
    this.focusNode,
    this.enabled = true,
    this.showLabel = true, this.suffixIcon,
  }) : super(key: key);

  final String title;
  final String? hintText;
  final String? initialValue;
  final void Function(String) onChanged;
  final void Function(String) onSubmit;
  final TextInputType inputType;
  final TextEditingController? controller;
  final bool isReadonly;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool enabled;
  final bool showLabel;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<PANInputFieldWidget> createState() => _PANInputFieldWidgetState();
}

class _PANInputFieldWidgetState extends State<PANInputFieldWidget> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _numeric = false;
  late TextInputType _inputType;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    _inputType = TextInputType.text;
  }

  void _switch() {
    _focusNode.unfocus();
    // FocusScope.of(context).unfocus();

    setState(() {
      _numeric = !_numeric;
      WidgetsBinding.instance.addPostFrameCallback(
            (_) => Future.delayed(const Duration(milliseconds: 350)).then((value) {
          FocusScope.of(context).requestFocus(_focusNode);
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText ?? widget.title,
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
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.all(16.0),
        prefixIcon: const Icon(Icons.code),
        prefixIconColor: Colors.blueGrey,
        counter: null,
        counterText: '',
      ),
      inputFormatters: [
        UpperCaseTextFormatter(),
      ],
      onChanged: (value) {
        widget.onChanged(value);

        if (value.length == 5) {
          if (_numeric == false) {
            _switch();
          }
        } else if (value.length < 5) {
          if (_numeric == true) {
            _switch();
          }
        } else if (value.length > 5 && value.length < 9) {
          if (_numeric == false) {
            _switch();
          }
        } else if (value.length == 9) {
          if (_numeric == true) {
            _switch();
          }
        }
      },
      onSubmitted: widget.onSubmit,
      keyboardType: _numeric && _controller.value.text.length >= 5
          ? const TextInputType.numberWithOptions()
          : TextInputType.text,
      autocorrect: false,
      readOnly: widget.isReadonly,
      maxLength: 10,
    );
  }
}
