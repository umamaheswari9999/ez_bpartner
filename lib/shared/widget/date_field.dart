import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef DateCallback = void Function(DateTime);

class DateField extends StatefulWidget {
  final DateCallback onDateSelected;

  final String title;
  final String? initialDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? hintText;
  final bool? readOnly;

  const DateField({
    Key? key,
    required this.onDateSelected,
    required this.title,
    this.initialDate,
    this.startDate,
    this.endDate,
    this.hintText,
    this.readOnly,
  }) : super(key: key);

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late TextEditingController _dateController;

  @override
  Widget build(BuildContext context) {
    final startDate = widget.startDate ??
        DateTime.now().subtract(const Duration(days: 365 * 100));
    final endDate = widget.endDate ?? DateTime.now().add(const Duration(days: 365 * 100));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurface,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        TextFormField(
          controller: _dateController,
          readOnly: true,
          onTap: () {
            if (widget.readOnly == true) {
              return;
            } else {
              _openDatePicker(context, startDate, endDate);
            }
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: Colors.grey.shade500,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: Colors.grey.shade500,
              ),
            ),
            hintStyle: Theme.of(context).textTheme.bodySmall!,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: Colors.grey.shade500,
              ),
            ),
            contentPadding: const EdgeInsets.all(16.0).copyWith(left: 6),
            counter: const SizedBox(width: 0, height: 0),
            helperMaxLines: 2,
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: () {
                if (widget.readOnly == true) {
                  return;
                } else {
                  _openDatePicker(context, startDate, endDate);
                }
              },
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: widget.initialDate);
  }

  void _openDatePicker(
      BuildContext context, DateTime startDate, DateTime endDate) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: startDate,
        lastDate: endDate,
        locale: const Locale('en', 'IN'),
        fieldHintText: 'dd-MM-yyyy',
        currentDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color(0xFF8CE7F1),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        }).then((value) {
      if (value != null) {
        widget.onDateSelected(value);
        _dateController.text = DateFormat('dd-MM-yyyy').format(value);
      }
    });
  }
}
