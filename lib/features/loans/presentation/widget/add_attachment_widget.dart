import 'package:file_picker/file_picker.dart';
import 'package:universal_io/io.dart' as io;

import 'package:ez_flutter/features/loans/presentation/bloc/add_attachment/add_attachment_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/attachment_doc_types/attachment_doc_types_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/widget/choice_chip_list_widget.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/model/simple.dart';
import 'package:ez_flutter/shared/widget/attachment_selector_widget.dart';
import 'package:ez_flutter/shared/widget/failure_widget.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAttachmentWidget extends StatefulWidget {
  const AddAttachmentWidget({
    Key? key,
    required this.loanId,
  }) : super(key: key);

  final String loanId;

  @override
  State<AddAttachmentWidget> createState() => _AddAttachmentWidgetState();
}

class _AddAttachmentWidgetState extends State<AddAttachmentWidget> {
  Simple? _docType;
  String? filepath;
  PlatformFile? _file;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAttachmentCubit, AddAttachmentState>(
      listener: (ctx, state) {
        state.maybeWhen(
          success: (attachment) => Navigator.of(context).pop(_docType),
          failure: (f) {
            f.maybeWhen(
              invalidFieldValue: (error) =>
                  showErrorDialog(context, error ?? 'Please select all values'),
              serverFailure: (code, error) => showErrorDialog(context, error),
              orElse: () =>
                  showErrorDialog(context, 'Uh oh. File upload failed'),
            );
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text('Add New Attachment',style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
            const SizedBox(height: 8),
            BlocBuilder<AttachmentDocTypesCubit, AttachmentDocTypesState>(
              builder: (ctx, state) {
                return state.when(
                  initial: () => const Center(child: CircularProgressIndicator()),
                  loading: () {
                    return ChoiceChoiceListWidget(
                      title: 'Type',
                      items: const [],
                      onSelected: (selected) {},
                    );
                  },
                  success: (types) {
                    return ChoiceChoiceListWidget(
                      title: 'Type',
                      items: types
                          .map((e) => Simple(id: e.id, title: e.title))
                          .toList(),
                      onSelected: (selectType) {
                        final selected = types
                            .where((element) => selectType == element.id)
                            .toList();
                        if (selected.isNotEmpty) {
                          _docType = selected.first;
                        }
                      },
                    );
                  },
                  failure: (f) {
                    return FailureWidget(
                      failure: f,
                      onRefresh: () {
                        BlocProvider.of<AttachmentDocTypesCubit>(context).fetchAttachmentDocTypes();
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 8),
            AttachmentSelectorInputField(
              title: 'SELECT FILE',
              onAttachmentSelected: (file, path) {
                _file = file;
                filepath = path;
              },
            ),
            const SizedBox(height: 8),
            BlocBuilder<AddAttachmentCubit, AddAttachmentState>(
              builder: (ctx, state) {
                final isLoading = state.maybeMap(
                  orElse: () => false,
                  loading: (_) => true,
                );

                return PrimaryButton(
                  text: isLoading ? 'Please wait...' : 'UPLOAD',
                  onPressed: isLoading
                      ? null
                      : () {
                          BlocProvider.of<AddAttachmentCubit>(context).addAttachment(
                            recordId: widget.loanId,
                            docType: _docType,
                            file: _file,
                            filepath: filepath,
                          );
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
