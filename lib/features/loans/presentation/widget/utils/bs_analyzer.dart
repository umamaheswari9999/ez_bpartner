import 'package:ez_flutter/constants/templates.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/loans/domain/entity/pre_enquiry_form.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action.dart';
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart';
import 'package:ez_flutter/shared/context_utils.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:ez_flutter/shared/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

class BSAnalyzerWidget extends StatelessWidget {
  const BSAnalyzerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewLoanCubit, NewLoanState>(
      builder: (context, state) {
        final form = state.form!;
        final url = form.ldsBsurl;
        final generate = url == null || url.trim().isEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (generate) ...[
              ListTile(
                minLeadingWidth: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                leading: const Icon(Icons.lightbulb_sharp, color: Colors.green),
                title: Text(
                  Templates.bankStatement,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ] else ...[
              ListTile(
                dense: true,
                minVerticalPadding: 0,
                horizontalTitleGap: 4,
                onTap: () => launchUrlExternal(url),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade400),
                ),
                minLeadingWidth: 0,
                leading: const Icon(Icons.touch_app, color: Colors.grey),
                title: Text(
                  'Generated Successfully..!',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.green),
                ),
                subtitle: Text(
                  url,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  onPressed: () => _shareUrl(form),
                  icon: const Icon(Icons.share),
                ),
              ),
            ],
            VerticalSpacing.small,
            BlocConsumer<NewLoanActionCubit, NewLoanActionState>(
              listener: (context, state) {
                state.maybeWhen(
                  failure: (action, failure) {
                    if (action == NewLoanAction.downloadBankStatement) {
                      failure.maybeWhen(
                        serverFailure: (code, message) => showSnackbar(context, message),
                        apiFailure: (message) => showSnackbar(context, message),
                        orElse: () {},
                      );
                    }
                  },
                  success: (action, data) {
                    if (action == NewLoanAction.downloadBankStatement) {
                      if (data != null && data['status'] != null) {
                        final status = data['status'] as bool;
                        if (status) {
                          showSnackbar(context, 'Downloaded Bank Status Successfully..!');
                          BlocProvider.of<NewLoanActionCubit>(context).checkCibilLimit(form.id);
                        }
                      }
                    }
                    if (action == NewLoanAction.generateBSAnalyzerLink) {
                      if (data != null && data['loan'] != null) {
                        final updatedform = data['loan'] as PreEnquiryForm;
                        BlocProvider.of<NewLoanCubit>(context).updateForm(updatedform);
                      }
                      showSnackbar(context, 'BSLink generated and shared with customer');
                    }
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                final isloading = state.maybeWhen(
                  loading: (action) =>
                      action == NewLoanAction.generateBSAnalyzerLink ||
                      action == NewLoanAction.downloadBankStatement,
                  orElse: () => false,
                );
                if (isloading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(strokeWidth: 2.0),
                  );
                }
                return PrimaryButton(
                  primary: Colors.orangeAccent.shade200,
                  elevation: 0,
                  onPressed: () {
                    if(generate) {
                      BlocProvider.of<NewLoanActionCubit>(context).generateAndSendBSLink(form.id);
                    } else {
                      BlocProvider.of<NewLoanActionCubit>(context).downloadBankStatement(form.id);
                    }
                  },
                  text: generate
                      ? 'Generate Bank Statement'.toUpperCase()
                      : 'Check Status'.toUpperCase(),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _shareUrl(PreEnquiryForm form) async {
    final details = locator.get<AppStaticData>();
    final supportEmail = details.contactUsEmail;
    final supportcontact = details.contactUsNumber;
    final bsurl = form.ldsBsurl!;
    final customername = form.customerName;
    const message = Templates.shareBankStatement;
    final formattedMessage = message
        .replaceAll('{var1}', customername)
        .replaceAll('{var2}', bsurl)
        .replaceAll('{var3}', supportEmail)
        .replaceAll('{var4}', supportcontact);
    await FlutterShare.share(
      title: 'Share BankStatement URL',
      text: formattedMessage,
      linkUrl: bsurl,
      chooserTitle: 'Share via',
    );
  }
}
