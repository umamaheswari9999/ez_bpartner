import 'package:ez_flutter/shared/model/simple.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:flutter/material.dart';

class ChoiceChoiceListWidget extends StatefulWidget {
  const ChoiceChoiceListWidget({
    Key? key,
    required this.title,
    required this.items,
    required this.onSelected,
    this.defaultSelection,
    this.dropdownViewStyle = true,
    this.disable = false,
  }) : super(key: key);

  final String title;
  final List<Simple> items;
  final String? defaultSelection;
  final bool dropdownViewStyle;
  final bool? disable;
  final void Function(String) onSelected;

  @override
  State<ChoiceChoiceListWidget> createState() => _ChoiceChoiceListWidgetState();
}

class _ChoiceChoiceListWidgetState extends State<ChoiceChoiceListWidget> {
  String? _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.defaultSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        if (widget.dropdownViewStyle) ...[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            // padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: IgnorePointer(
              ignoring: widget.disable!,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    value: _selectedId,
                    style: Theme.of(context).textTheme.bodyLarge,
                    borderRadius: BorderRadius.circular(8.0),
                    items: widget.items.map(
                      (e) => DropdownMenuItem<String>(
                        value: e.id,
                        child: Text(e.title, overflow: TextOverflow.visible),
                      ),
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        widget.onSelected(value!);
                        _selectedId = value;
                      });
                    },
                    hint: Text(widget.title),
                    isExpanded: true,
                  ),
                ),
              ),
            ),
          )
        ] else ...[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 12,
              children: [
                ...widget.items
                    .map(
                      (e) => ChoiceChip(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 8.0,
                        ),
                        label: Text(e.title),
                        selected: _selectedId == e.id,
                        selectedColor: Theme.of(context).colorScheme.primary,
                        labelStyle: Theme.of(context).textTheme.bodyLarge,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              widget.onSelected(e.id);
                              _selectedId = e.id;
                            });
                          } else {
                            setState(() {
                              widget.onSelected('');
                              _selectedId = null;
                            });
                          }
                        },
                      ),
                    ).toList(),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
