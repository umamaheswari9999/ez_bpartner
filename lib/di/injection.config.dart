// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:ez_flutter/di/external_libs_injection.dart' as _i45;
import 'package:ez_flutter/features/auth/data/repo/auth_repo_impl.dart' as _i10;
import 'package:ez_flutter/features/auth/domain/repo/auth_repo.dart' as _i9;
import 'package:ez_flutter/features/auth/presentation/bloc/app_update/app_update_cubit.dart'
    as _i34;
import 'package:ez_flutter/features/auth/presentation/bloc/auth/auth_cubit.dart'
    as _i36;
import 'package:ez_flutter/features/auth/presentation/bloc/forgot_pswd/forgot_pswd.dart'
    as _i12;
import 'package:ez_flutter/features/auth/presentation/bloc/lost_userid/lost_userid.dart'
    as _i17;
import 'package:ez_flutter/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart'
    as _i29;
import 'package:ez_flutter/features/home/data/home_repo.dart' as _i13;
import 'package:ez_flutter/features/home/presentation/bloc/app_scrn/app_scrn_cubit.dart'
    as _i3;
import 'package:ez_flutter/features/home/presentation/bloc/status_count/status_count_cubit.dart'
    as _i31;
import 'package:ez_flutter/features/loans/data/repo/loan_repo_impl.dart'
    as _i15;
import 'package:ez_flutter/features/loans/domain/repo/loan_repo.dart' as _i14;
import 'package:ez_flutter/features/loans/presentation/bloc/add_attachment/add_attachment_cubit.dart'
    as _i32;
import 'package:ez_flutter/features/loans/presentation/bloc/add_note/add_note_cubit.dart'
    as _i33;
import 'package:ez_flutter/features/loans/presentation/bloc/attachment_doc_types/attachment_doc_types_cubit.dart'
    as _i35;
import 'package:ez_flutter/features/loans/presentation/bloc/bank_accounts/bank_accounts_cubit.dart'
    as _i37;
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner/bpartner_cubit.dart'
    as _i39;
import 'package:ez_flutter/features/loans/presentation/bloc/bpartner_add/bpartner_add_cubit.dart'
    as _i38;
import 'package:ez_flutter/features/loans/presentation/bloc/download_attachment/download_attachment_cubit.dart'
    as _i40;
import 'package:ez_flutter/features/loans/presentation/bloc/emi_plans/emi_plans_cubit.dart'
    as _i42;
import 'package:ez_flutter/features/loans/presentation/bloc/kyc_check/kyc_check_cubit.dart'
    as _i43;
import 'package:ez_flutter/features/loans/presentation/bloc/loan_attachments/loan_attachments_cubit.dart'
    as _i44;
import 'package:ez_flutter/features/loans/presentation/bloc/loans/loans_cubit.dart'
    as _i16;
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan/new_loan_cubit.dart'
    as _i19;
import 'package:ez_flutter/features/loans/presentation/bloc/new_loan_actions/new_loan_action_cubit.dart'
    as _i18;
import 'package:ez_flutter/features/loans/presentation/bloc/notes/notes_cubit.dart'
    as _i20;
import 'package:ez_flutter/features/loans/presentation/bloc/ocr_pan_validation/ocr_pan_validation_cubit.dart'
    as _i24;
import 'package:ez_flutter/features/loans/presentation/bloc/pan_validation/pan_validation_cubit.dart'
    as _i25;
import 'package:ez_flutter/features/loans/presentation/bloc/pincode_hold/pincode_hold_check_cubit.dart'
    as _i26;
import 'package:ez_flutter/features/loans/presentation/bloc/recent_loans/recent_loans_cubit.dart'
    as _i27;
import 'package:ez_flutter/features/loans/presentation/bloc/states/states_cubit.dart'
    as _i30;
import 'package:ez_flutter/features/notifications/data/repository/notifications_repo_impl.dart'
    as _i22;
import 'package:ez_flutter/features/notifications/domain/repository/notification_repository.dart'
    as _i21;
import 'package:ez_flutter/features/notifications/presentation/bloc/notification_bloc/notification_cubit.dart'
    as _i23;
import 'package:ez_flutter/features/reports/data/reports_repo.dart' as _i28;
import 'package:ez_flutter/features/reports/presentation/bloc/download_report/download_reports.dart'
    as _i41;
import 'package:ez_flutter/network/api_helper.dart' as _i7;
import 'package:ez_flutter/shared/usecases/app_version_usecase.dart' as _i8;
import 'package:ez_flutter/shared/usecases/check_user_credentails_usecase.dart'
    as _i11;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalLibs = _$ExternalLibs();
    gh.factory<_i3.AppScreenCubit>(() => _i3.AppScreenCubit());
    gh.lazySingleton<_i4.Client>(() => externalLibs.client);
    gh.lazySingleton<_i5.Dio>(() => externalLibs.dio);
    gh.lazySingleton<_i6.FlutterSecureStorage>(
        () => externalLibs.secureStorage);
    gh.lazySingleton<_i7.ApiHelper>(() => _i7.ApiHelper(gh<_i5.Dio>()));
    gh.factory<_i8.AppVersionUseCase>(
        () => _i8.AppVersionUseCase(gh<_i7.ApiHelper>()));
    gh.lazySingleton<_i9.AuthRepo>(() => _i10.AuthRepoImpl(
          gh<_i7.ApiHelper>(),
          gh<_i6.FlutterSecureStorage>(),
        ));
    gh.factory<_i11.CheckUserCredentialsUseCase>(
        () => _i11.CheckUserCredentialsUseCase(gh<_i7.ApiHelper>()));
    gh.factory<_i12.ForgotPswdCubit>(
        () => _i12.ForgotPswdCubit(gh<_i9.AuthRepo>()));
    gh.lazySingleton<_i13.HomeRepo>(() => _i13.HomeRepo(gh<_i7.ApiHelper>()));
    gh.lazySingleton<_i14.LoanRepo>(
        () => _i15.LoanRepoImpl(gh<_i7.ApiHelper>()));
    gh.factory<_i16.LoansCubit>(() => _i16.LoansCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i17.LostUseridCubit>(
        () => _i17.LostUseridCubit(gh<_i9.AuthRepo>()));
    gh.factory<_i18.NewLoanActionCubit>(
        () => _i18.NewLoanActionCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i19.NewLoanCubit>(() => _i19.NewLoanCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i20.NotesCubit>(() => _i20.NotesCubit(gh<_i14.LoanRepo>()));
    gh.lazySingleton<_i21.NotificationRepository>(
        () => _i22.NotificationRepoImpl(gh<_i7.ApiHelper>()));
    gh.factory<_i23.NotificationsCubit>(
        () => _i23.NotificationsCubit(gh<_i21.NotificationRepository>()));
    gh.factory<_i24.OcrPanValidationCubit>(
        () => _i24.OcrPanValidationCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i25.PanValidationCubit>(
        () => _i25.PanValidationCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i26.PincodeHoldCheckCubit>(
        () => _i26.PincodeHoldCheckCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i27.RecentLoansCubit>(
        () => _i27.RecentLoansCubit(gh<_i14.LoanRepo>()));
    gh.lazySingleton<_i28.ResportsRepo>(
        () => _i28.ResportsRepo(gh<_i7.ApiHelper>()));
    gh.factory<_i29.SignInCubit>(
        () => _i29.SignInCubit(repo: gh<_i9.AuthRepo>()));
    gh.factory<_i30.StatesCubit>(() => _i30.StatesCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i31.StatusCountCubit>(
        () => _i31.StatusCountCubit(gh<_i13.HomeRepo>()));
    gh.factory<_i32.AddAttachmentCubit>(
        () => _i32.AddAttachmentCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i33.AddNoteCubit>(() => _i33.AddNoteCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i34.AppUpdateCubit>(
        () => _i34.AppUpdateCubit(gh<_i8.AppVersionUseCase>()));
    gh.factory<_i35.AttachmentDocTypesCubit>(
        () => _i35.AttachmentDocTypesCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i36.AuthCubit>(() => _i36.AuthCubit(
          repository: gh<_i9.AuthRepo>(),
          checkUserCredentialsUseCase: gh<_i11.CheckUserCredentialsUseCase>(),
        ));
    gh.factory<_i37.BankAccountsCubit>(
        () => _i37.BankAccountsCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i38.BpartnerAddCubit>(
        () => _i38.BpartnerAddCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i39.BpartnerCubit>(
        () => _i39.BpartnerCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i40.DownloadAttachmentCubit>(
        () => _i40.DownloadAttachmentCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i41.DownloadReportCubit>(
        () => _i41.DownloadReportCubit(gh<_i28.ResportsRepo>()));
    gh.factory<_i42.EmiPlansCubit>(
        () => _i42.EmiPlansCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i43.KycCheckCubit>(
        () => _i43.KycCheckCubit(gh<_i14.LoanRepo>()));
    gh.factory<_i44.LoanAttachmentsCubit>(
        () => _i44.LoanAttachmentsCubit(gh<_i14.LoanRepo>()));
    return this;
  }
}

class _$ExternalLibs extends _i45.ExternalLibs {}
