import 'dart:async';

import 'package:ez_flutter/features/auth/presentation/widgets/input_filed2.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner/bpartner_cubit.dart';
import 'package:ez_flutter/shared/model/id_name.dart';
import 'package:ez_flutter/shared/widget/empty_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BPartnerSelection extends StatefulWidget {
  final String? inital;
  final void Function(IdName bprtner) onBPSelection;
  const BPartnerSelection({Key? key, this.inital, required this.onBPSelection})
      : super(key: key);

  @override
  State<BPartnerSelection> createState() => _BPartnerSelectionState();
}

class _BPartnerSelectionState extends State<BPartnerSelection> {
  late TextEditingController _bpname;
  late ScrollController _scrollController;
  Timer? _debounce;
  String? query;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BpartnerCubit>(context).fetchInitial();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _bpname = TextEditingController();
  }

  void _onSearchQuery(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      BlocProvider.of<BpartnerCubit>(context).fetchInitial(query: query);
      setState(() {});
    });
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      BlocProvider.of<BpartnerCubit>(context).fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<BpartnerCubit>(context),
            child: showBPList(),
          ),
        ).then((value) {
          if (_bpname.text.isNotEmpty) {
            setState(() {
              _bpname.clear();
            });
            return BlocProvider.of<BpartnerCubit>(context)..fetchInitial();
          }
        });
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueGrey,
          ),
          borderRadius: BorderRadius.circular(8),
          color:Colors.white,
        ),
        child: Text(widget.inital ?? 'Select Business Partner'),
      ),
    );
  }

  Widget showBPList() {
    return Column(
      children: [
        // VerticalSpacing.small,
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(4.0),
          child: InputFiled2(
            title: 'Search Agent by name',
            controller: _bpname,
            onSubmit: (text) {
              if (text.trim().isNotEmpty) {
                _onSearchQuery(_bpname.text);
              }
            },
            hintText: 'Search Agent by name',
            suffixWidget: IconButton(
              onPressed: () {
                setState(() {
                  _bpname.clear();
                });
                if (_bpname.text.isNotEmpty) {
                  BlocProvider.of<BpartnerCubit>(context).fetchInitial();
                }
              },
              icon: const Icon(Icons.cancel),
            ),
          ),
        ),
        // const Divider(),
        BlocBuilder<BpartnerCubit, BPartnerState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (records, hasReachedMax, query) {
                if (records.isEmpty) {
                  return EmptyListWidget(
                    message: 'No Aagents Found',
                    onRefresh: () {
                      BlocProvider.of<BpartnerCubit>(context).fetchInitial();
                    },
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 4).copyWith(bottom: 10),
                    separatorBuilder: (context, index) => const SizedBox(height: 2),
                    controller: _scrollController,
                    // shrinkWrap: true,
                    itemCount: records.length + (hasReachedMax ? 0 : 1),
                    itemBuilder: (ctxt, index) {
                      if (index >= records.length) {
                        return const CupertinoActivityIndicator();
                      }
                      final bpartner = records[index];
                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.only(left: 4),
                        onTap: () {
                          widget.onBPSelection(bpartner);
                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        title: Text(bpartner.name),
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
