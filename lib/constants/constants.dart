abstract class Constants {
 static const baseApiUrl = 'https://sairoshni.nettlinx.com/erp';
  static const baseDefaultApiUrl = '$baseApiUrl/org.openbravo.service.json.jsonrest';
  static const baseCustomApiUrl = '$baseApiUrl/ws';
  static const bpFAQsUrl = "https://ezfinanz.com/business-partner-2";
  static const termsAndConditionsUrl = "https://ezfinanz.com/terms";
  static const emptyServerResponse = -3;
  static const repoException = -5;
  
  static const unexpectedResponse = -6;
  static const documentsNeededCode = -7;
  static const oneSignalId = "551acae2-61eb-4647-9b88-48519453808e";
  static const aadhaarProofTypeId = "F8CA4CB658174C669EB6897F936313F3";
  static const panProofTypeId = "44E2956938B74346A5CEBDD018032ACA";
  static const kycOtpLength = 6;
  static const consentBrowserUsed = 'BP APP';
  static const eSignActionResend = 'RESEND';
  static const actionInitiate = 'INITIATE';
  static const eSignStatusApproved = 'Approved';
  static const eSignStatusRejected = 'Rejected';
  static const eMandateStatusApproved = 'auth_success';
  static const eMandateStatusRejected = 'auth_failed';
  static const eMandateStatusSuccess = 'register_success';
  static const kycPhotographName = 'Photograph.jpeg';
  static const indiaCountryCode = '208';
  static const prefAndroidAppVersion = 'Agent App Android Version';
  static const prefIOSAppVersion = 'Agent App IOS Version';
  static const iosAppId = 1637298449;

  static String mapMandateType(String type) {
    switch (type) {
      case 'E':
        return 'E-Mandate';
      case 'P':
        return 'Physical';
      default:
        return type;
    }
  }
}

abstract class LocalStorageKeys {
  static const _prefix = 'com.ezfinanz.business';
  static const user = '$_prefix.user';
  static const apiuser = '$_prefix.apiuser';
}

abstract class LoanStage {
  static const draft = 'DR';
  static const waitingForKyc = 'WKYC';
  static const reviewKyc = 'RKYC';
  static const additionalInfo = 'AI';
  static const bankDetails = 'BD';
  static const loanRequirements = 'LR';
  static const initiateESign = 'IES';
  static const waitingForESign = 'WES';
  static const eSignRejected = 'RES';
  static const initialEMandate = 'IEM';
  static const waitingForEMandate = 'WEM';
  static const eMandateRejected = 'REM';
  static const waitingForPreApproval = 'WPA';
  static const waitingForCallVerification = 'WCV';
  static const preApproved = 'PA';
  static const waitingForDisbursement = 'WAD';
  static const disbursed = 'DI';

  static String mapStage(String stage) {
    switch (stage) {
      case draft:
        return 'Draft';
      case waitingForKyc:
        return 'Waiting for KYC';
      case reviewKyc:
        return 'Review KYC';
      case additionalInfo:
        return 'Additional Info';
      case bankDetails:
        return 'Bank Details';
      case loanRequirements:
        return 'Loan Requirements';
      case initiateESign:
      case waitingForESign:
      case eSignRejected:
      case initialEMandate:
      case waitingForEMandate:
      case eMandateRejected:
        return 'eSign & eMandate';
      case waitingForCallVerification:
        return 'Call Verification';
      case waitingForPreApproval:
        return 'Final Approval';
      case preApproved:
        return 'Pre Approved';
      case waitingForDisbursement:
        return 'To be disbursed';
      case disbursed:
        return 'Disbursed';
      default:
        return stage;
    }
  }
}

abstract class GetScoreApiActions {
  static const preApprove = 'Pre approve';
  static const sendToEnquiry = 'Send to enquiry';
  static const downloadCibil = 'Download Cibil';
  static const getScore = 'Get Score';
  static const downloadBankStatement = 'Download Bank Statement';
}

abstract class LoanEligibility {
  static const eligible = 'E';
  static const refer = 'RE';
  static const rejected = 'NE';
}

abstract class AadharKycActions {
  static const generate = 'generate';
  static const submit = 'submit';
}

abstract class PreferenceKeys {
  static const appStaticData = 'APP_STATIC_DATA';
}

abstract class Entities {
  static const user = 'ADUser';
  static const bpartner = 'BusinessPartner';
  static const bpartnerAdd = 'BusinessPartnerLocation';
  static const pushNotification = 'EPN_PushNotification';
  static const note = 'OBUIAPP_Note';
  static const preEnquiry = 'Lds_Preenquiryform';
  static const enquiryForm = 'Lds_Enquiryform';
  static const financialAccount = 'FIN_Financial_Account';
  static const emiPlans = 'lds_emiplan';
  static const preference = 'ADPreference';
  static const clientMaster = 'lds_aadharmaster';
  static const attachmentDocTypes = 'lds_documentmaster';
  static const attachment = 'ADAttachment';
  static const location = 'Location';
  static const region = 'Region';
}

abstract class CustomWebServices {
  static const sendSMS = 'com.saksham.loandetails.sendSMS';
  static const queryService = 'in.easycloud.commons.QueryService';
  static const createUser = 'com.saksham.uploadfile.createuser';
  static const verifyOTP = 'com.saksham.loandetails.verifyOtp';
  static const pushNotification = "in.easycloud.pns.service";
  static const signIn = "com.saksham.loandetails.fetchUserandAppDetails";
  static const recentLoans = "com.saksham.loandetails.fetchAgentRecentLoans";
  static const generic = "com.saksham.loandetails.generic";
  static const clientMasterDetails =
      "com.saksham.loandetails.fetchclientMasterDetails";
  static const sendKycOtp = 'com.saksham.loandetails.KYC_Otp';
  static const fetchKycData = 'com.saksham.loandetails.KYC_Data';
  static const addNewBank = 'com.saksham.loandetails.addBank';
  static const getScore = 'com.saksham.loandetails.GetFinalScore';
  static const sendESignLink = 'com.saksham.loandetails.eSign';
  static const sendEMandateLink = 'com.saksham.loandetails.eMandate';
  static const fetchBankDetails = 'com.saksham.loandetails.fetchBankDetails';
  static const attachmentWs = "in.easycloud.rest.files.multipart";
  static const attachmentWsV2 = "in.easycloud.rest.files.v2";
  static const aadharKyc = "com.saksham.loandetails.newCustomerAadhaarKyc";
  static const pincodeHoldCheck = "com.saksham.pincode.Epd_CheckHold";
  static const loanterms = "com.saksham.loandetails.loanTerms_Calculation";
  static const generateBSLink = "com.saksham.loandetails.LDS_GenerateSend_BSlink";
  static const downloadBankStatement = "com.saksham.loandetails.Download_BankStatement";
}
