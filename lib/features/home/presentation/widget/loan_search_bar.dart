import 'package:ez_flutter/shared/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class LoanSearchBar extends StatefulWidget {
  const LoanSearchBar({
    Key? key,
     this.onSearch,
     this.onFiltersClicked,
     this.onCancel,
    this.displayFilters = false,
    this.enabled = false,
    this.autoFocus = false,
  }) : super(key: key);

  final void Function(String)? onSearch;
  final VoidCallback? onCancel;
  final VoidCallback? onFiltersClicked;
  final bool displayFilters;
  final bool enabled;
  final bool autoFocus;

  @override
  State<LoanSearchBar> createState() => _LoanSearchBarState();
}

class _LoanSearchBarState extends State<LoanSearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              enabled: widget.enabled,
              autofocus: widget.autoFocus,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
                contentPadding: const EdgeInsets.all(16.0),
                hintText: 'Search loans by name, loan number, person name ...',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black54,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(FeatherIcons.search, color: Colors.black),
                suffixIcon: _searchController.text.trim().isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          if (widget.onCancel != null) widget.onCancel!();
                          setState(() {
                            _searchController.clear();
                          });
                        },
                        icon: const Icon(FeatherIcons.xCircle),
                      )
                    : const SizedBox(width: 0, height: 0),
              ),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
              onChanged: (val) {
                setState(() {});
              },
              onSubmitted: widget.onSearch,
            ),
          ),
          Visibility(
            visible: widget.displayFilters,
            child: Container(
              margin: const EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGrey,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(FeatherIcons.filter),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
