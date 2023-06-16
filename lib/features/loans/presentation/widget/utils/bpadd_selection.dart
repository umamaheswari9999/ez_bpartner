import 'dart:async';

import 'package:ez_flutter/features/auth/presentation/widgets/input_filed2.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner_add/bpartner_add_cubit.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:ez_flutter/shared/widget/empty_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BPAddressSelection extends StatefulWidget {
  final String? initalAddress;
  final String? bpartnerId;
  final bool? isEnabled;
  final void Function(IdName bprtner) onBPAddSelection;

  const BPAddressSelection({
    Key? key,
    this.initalAddress,
    this.bpartnerId,
    required this.onBPAddSelection,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  State<BPAddressSelection> createState() => _BPAddressSelectionState();
}

class _BPAddressSelectionState extends State<BPAddressSelection> {
  late TextEditingController _query;
  late ScrollController _scrollController;
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    _query = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onSearchQuery(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      BlocProvider.of<BpartnerAddCubit>(context)
          .fetchInitial(widget.bpartnerId!, query: query);
      setState(() {});
    });
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      BlocProvider.of<BpartnerAddCubit>(context).fetchMore(widget.bpartnerId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isEnabled == false
          ? null
          : () {
              widget.bpartnerId == null
                  ? showSnackbar(context, 'Please select Business Partner')
                  : showModalBottomSheet(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<BpartnerAddCubit>(context),
                        child: showBPList(),
                      ),
                    ).then((value) {
                      if (_query.text.isNotEmpty) {
                        setState(() {
                          _query.clear();
                        });
                        BlocProvider.of<BpartnerAddCubit>(context)
                            .fetchInitial(widget.bpartnerId!);
                      }
                    });
            },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.blueGrey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.initalAddress ?? 'Select Business Partner address',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.arrow_downward_outlined,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  Widget showBPList() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(4.0),
          child: InputFiled2(
            title: 'Search Agent Address by name',
            applyFormatters: false,
            defaultColor: Colors.blue,
            controller: _query,
            onSubmit: (text) {
              if (text.trim().isNotEmpty) {
                _onSearchQuery(_query.text);
              }
            },
            hintText: 'Search Agent Address by name',
            suffixWidget: IconButton(
              onPressed: () {
                if (_query.text.isNotEmpty) {
                  setState(() {
                    _query.clear();
                  });
                  BlocProvider.of<BpartnerAddCubit>(context)
                      .fetchInitial(widget.bpartnerId!);
                }
              },
              icon: const Icon(Icons.cancel),
            ),
          ),
        ),
        BlocBuilder<BpartnerAddCubit, BPartnerAddState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (records, hasReachedMax, query) {
                if (records.isEmpty) {
                  if (query != null && query.trim().isNotEmpty) {
                    return EmptyListWidget(
                      message: 'No Agent Address found with that query.',
                      onRefresh: () {
                        setState(() {
                          _query.clear();
                        });
                        BlocProvider.of<BpartnerAddCubit>(context)
                            .fetchInitial(widget.bpartnerId!, query: '');
                      },
                    );
                  }
                  return EmptyListWidget(
                    message: 'No Agent Addresses Found',
                    onRefresh: () {
                      BlocProvider.of<BpartnerAddCubit>(context)
                          .fetchInitial(widget.bpartnerId!);
                    },
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 4)
                        .copyWith(bottom: 10),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 2),
                    controller: _scrollController,
                    // shrinkWrap: true,
                    itemCount: records.length + (hasReachedMax ? 0 : 1),
                    itemBuilder: (ctxt, index) {
                      if (index >= records.length) {
                        return const CupertinoActivityIndicator();
                      }
                      final address = records[index];
                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.only(left: 4),
                        onTap: () {
                          widget.onBPAddSelection(address);
                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        title: Text(address.name),
                      );
                    },
                  ),
                );
              },
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ],
    );
  }
}
