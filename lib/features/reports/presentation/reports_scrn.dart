import 'package:ez_flutter/features/reports/presentation/bloc/download_report/download_reports.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/date_field.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReportsScrn extends StatefulWidget {
  const ReportsScrn({Key? key}) : super(key: key);

  @override
  State<ReportsScrn> createState() => _ReportsScrnState();
}

class _ReportsScrnState extends State<ReportsScrn> {
  String _searchBy = '0';
  late String fromdate;
  late String todate;
  @override
  void initState() {
    super.initState();
    fromdate = DateFormat('dd-MM-yyyy')
        .format(DateTime.now().subtract(const Duration(days: 30)));
    todate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Radio(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: '0',
                    groupValue: _searchBy,
                    onChanged: _onSearchByChanged,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text(
                    'BP Statement',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: '1',
                    groupValue: _searchBy,
                    onChanged: _onSearchByChanged,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text(
                    'Disbursement',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          VerticalSpacing.small,
          DateField(
            onDateSelected: (date) {
              setState(() {
                fromdate = DateFormat('dd-MM-yyyy').format(date);
              });
            },
            initialDate: fromdate,
            title: 'Select From Date'.toUpperCase(),
          ),
          DateField(
            onDateSelected: (date) {
              setState(() {
                todate = DateFormat('dd-MM-yyyy').format(date);
              });
            },
            initialDate: todate,
            title: 'Select To Date'.toUpperCase(),
          ),
          BlocBuilder<DownloadReportCubit, DownloadReportState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                orElse: () => false,
                loading: (action) => true,
              );
              return SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  elevation: 0,
                  text: isLoading ? 'Please Wait...' : 'Generate Statement',
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_searchBy == '0') {
                            BlocProvider.of<DownloadReportCubit>(context).downloadBankStatement(fromdate, todate);
                          } else {
                            BlocProvider.of<DownloadReportCubit>(context).downloadDisbursementReport(fromdate, todate);
                          }
                        },
                ),
              );
            },
          ),
          ListTile(
            tileColor: Colors.white,
            minLeadingWidth: 2,
            leading: const Icon(Icons.warning_amber_outlined, color: Colors.amber),
            title: _searchBy == '0'
                ? const Text(
                    'Generated BP Statement report will be sent to respective user and BP email.',
                    textAlign: TextAlign.center,
                  )
                : const Text(
                    'Generated Disbursement report will be sent to respective user and BP email.',
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }

  void _onSearchByChanged(String? value) {
    setState(() {
      _searchBy = value!;
    });
  }
}
