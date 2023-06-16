import 'package:ez_flutter/features/loans/presentation/bloc/download_attachment/download_attachment_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/loan_attachments/loan_attachments_cubit.dart';
import 'package:ez_flutter/utils/file_utils.dart';
import 'package:ez_flutter/shared/widget/failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';

class LoanAttachmentsWidget extends StatelessWidget {
  const LoanAttachmentsWidget({
    Key? key,
    required this.loanId,
  }) : super(key: key);

  final String loanId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadAttachmentCubit, DownloadAttachmentState>(
      listener: (ctx, state) {
        state.maybeWhen(
          success: (data, name) async {
            final file = await FileUtils.saveInTemp(data, name);
            await OpenFile.open(file.path);
          },
          orElse: () {},
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text('ATTACHMENTS'),
                const Spacer(),
                IconButton(
                  onPressed: () => _fetchAttachments(context),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 8),
          BlocBuilder<LoanAttachmentsCubit, LoanAttachmentsState>(
            builder: (ctx, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (records) {
                  if (records.isEmpty) {
                    return const Center(child: Text('No attachments found'));
                  }

                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        _fetchAttachments(context);
                        return Future.delayed(const Duration(seconds: 2));
                      },
                      child: ListView.separated(
                        itemCount: records.length,
                        separatorBuilder: (ctx, idx) => const Divider(),
                        itemBuilder: (ctx, idx) {
                          final record = records[idx];

                          return ListTile(
                            title: Text(record.name),
                            subtitle: Text(record.description),
                          );
                        },
                      ),
                    ),
                  );
                },
                failure: (f) {

                  return FailureWidget(
                    failure: f,
                    onRefresh: () {},
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _fetchAttachments(BuildContext context) {
    BlocProvider.of<LoanAttachmentsCubit>(context).fetchLoanAttachments(loanId);
  }
}
