
class AppConstants {
  static double figmaRefWidth = 375;
  static double figmaRefHeight = 812;

  static int animationDuration = 300;
  static int animationDurationShort = 300;
  static int animationDurationDelay = 400;

  static int connectionTimeOut = 200000;
  static int responseTimeOut = 200000;
  static const int MAX_RETRIES = 3;
  static String transferMethod = '';
  static String token = "";
  // static String fees = "";
  // static String vAT = "";

  static int roundValue = 3;
  static bool isMobileCode = false;
  static String isSubUser = "";
  static bool isTransferRights = false;
  static bool isBeban = false;
  static bool isSubUserStatus = false;
  static bool IsbuisnessAccount = false;
  static bool isKycExpire = false;
  static bool kycMandatory = false;
  static bool isMubasher = false;
  static bool isDash1 = false;

  static String publicKey =
      "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDlOJu6TyygqxfWT7eLtGDwajtNFOb9I5XRb6khyfD1Yt3YiCgQWMNW649887VGJiGr/L5i2osbl8C9+WJTeucF+S76xFxdU6jE0NQ+Z+zEdhUTooNRaY5nZiu5PgDB0ED/ZKBUSLKL7eibMxZtMlUDHjm4gwQco1KRMDSmXSMkDwIDAQAB";
  static String privateKey = '3F4528482B4D6251';

  static const String USER_CONTENT = 'USER_CONTENT';
  static const String UID = 'UID';
  static const String IS_BIOMETRIC_ENABLED = 'IS_BIOMETRIC_ENABLED';
  static const String HAS_RUN_BEFORE = 'HAS_RUN_BEFORE';
  static const String BIO_PRIVATE_KEY = 'BIO_PRIVATE_KEY';
  static const String BIO_PUBLIC_KEY = 'BIO_PUBLIC_KEY';
  static const String DEVICE_TOKEN = "DEVICE_TOKEN";
  static const String SURVEY_FILL = "SURVEY_FILL";

  static const String APP_STORE_URL = 'itms-apps://itunes.apple.com/app/apple-store/id1563925534';
  static const String PLAY_STORE_URL = 'https://play.google.com/store/apps/details?id=com.codebase.kfhwealthapp';

  static String privacyPolicyURL =
      'https://www.kfh.bh/dam/jcr:6f622310-2caf-4e38-a3a2-304d8930907d/G14717_KFH%20-%20Data%20Privacy%20Notice.pdf';
  static String termsOfServiceURL =
      'https://www.kfh.bh/dam/jcr:fa40bda6-93e3-4829-9eb9-fac9973b3289/KFH%20Terms%20&%20Condition%20(NEW)%20-%20Eng%202020.pdf';

  static String baseUrl = //"https://kfhbonline.com/Wealthapi/api/";
      "https://kfhbonline.com/wealthtest/api/";

  // static String baseUrl = "http://40.114.120.180:98/api/";

  static String verifyToken = "Auth/VerifyTokenV2";
  static String login = "Auth/LoginV3";
  static String registerBusiness = "Auth/RegisterBuisnessAccountV3";
  static String register = "Auth/RegisterV4";
  static String verifyMobileOTP = "Auth/verifyMobileOTP";
  static String verifyMobileOTPByType = "Auth/VerifyOtpByType";
  static String sendOTPToken = "Auth/sendotptoken";
  static String verifyEmailOTP = "Auth/verifyEmailOTP";
  static String resendEmailOTP = "Auth/ResendOnboardingEmailOTP";
  static String sendOnBoardingOTP = "Auth/SendOnboardingMobileOTP";
  static String changeMobile = "Auth/changeMobile";
  static String getAllowedMobile = "Country/GetAllowedMobile";
  static String verifyEmail = "Country/GetAllowedMobile";
  static String changeEmail = "Auth/changeEmail";
  static String currentversionPE = "AppVersion/currentversionPE?platform=";
  static String checkCPR = "/Auth/cprcheck";
  static String uploadFile = "/Files/UploadBoard";
  static String sendForgotPasswordOTPV3 = "/Auth/SendForgotPasswordOTPV3";
  static String verifyForgotPasswordOTPV3 = "/Auth/VerifyForgotPasswordOTPV3";
  static String changePasswordV3 = "/Auth/ChangePasswChangePasswordV3";
  static String enableBioMetric = "/Settings/EnableBioMetric";
  static String firstBioUpdate = "/Settings/FirstBioUpdate";
  static String disableBioMetric = "/Settings/DisableBioMetric";
  static String getCipher = "/Settings/GetCipher";
  static String bioLogin = "/Auth/AndroidLogin";
  static const String getIbanDetails = 'Benefeciary/GetIbanDetails';
  static const String getBeneficiaries = 'Benefeciary/GetBeneficiaries';
  static const String addBeneficiary = 'Benefeciary/AddBeneficiary';
  static const String sendTransferOTP = 'Transfer/SendTransferOTP';
  static const String mainDashboard = 'Auth/MainDashboardV2';
  static const String transfers = 'Transfer/Transfers';
  static const String convertCurrency = 'Transfer/convertCurrency';
  static const String getCurrencies = 'Transfer/GetCurrencies';
  static const String openBeban = '/trading/OpenBeban';
  static const String openMubasher = '/trading/OpenMubasher';
  static const String updateIncomestatus = '/trading/updateincomestatus';
  static const String fetchIncomeDetails = '/trading/FetchIncomeDetails';
  static const String FetchBebanList = '/trading/FetchBebanListV2';
  static const String sendTransferOTPV1 = '/Transfer/SendTransferOTPV1';
  static const String transfersV3 = '/Transfer/TransfersV3';
  static const String getReportCurrencies = 'Auth/GetReportCurrencies';
  static const String getListFieldValues = '/IdCard/GetListFieldValues';
  static const String getPortfolioSummary = '/DirectFN/GetPortFolioV2';
  static const String getSukukHoldings = '/DirectFN/GetSUKUKHolding';
  static const String sellSukuk = '/DirectFN/GetSUKUKHoldingV2';
  static const String getSukukTransaction = '/DirectFN/GetSUKUKTransactionV2';
  static const String getGraphData = '/DirectFN/GetSUKUKGraph';
  static const String settingsChangePassword = '/Settings/ChangePassword';
  static const String getTransferHistory = 'Transfer/GetTransferHistory';

  static const String getEquitiesHoldings = '/DirectFN/GetEquitiesHolding';
  static const String getSecuritizationHoldings =
      '/DirectFN/GetSecuritizationHolding';
  static const String getInvestmentTransaction =
      '/trading/GetInvestmentTransaction';
  static const String getCardTransaction =
      '/CreditCardApplication/GetCreditCardTransGroupByDate';
  static const String getWalletTransaction =
      '/trading/GetWalletTransaction';
  static const String getEquitiesTransaction =
      '/DirectFN/GetEquitiesTransaction';
  static const String getSecuritizationTransaction =
      '/DirectFN/GetSecuritizationTransactionV2';
  static const String getEquitiesData = '/DirectFN/GetEquitiesGraph';
  static const String getSecuritizationsData =
      '/DirectFN/GetSecuritizationGraph';
  static const String getWealthDashboard = '/DirectFN/WealthDashboardV3';
  static const String getShariahScreening = '/ShariahScreening/GetAll';
  static const String getBebanLogin = '/trading/GetBebanLogin';
  static const String NonWealthDashboard = '/DirectFN/NonWealthDashboard';
  static const String deleteBeneficiary = 'Benefeciary/DeleteBeneficiary';
  static const String verifyBeneficiaryOTP = "Benefeciary/VerifyBeneficiaryOTP";
  static const String resendBeneficiaryOTP = "Benefeciary/ResendBeneficiaryOTP";

  static const String renderSukukSummary = '/DirectFN/RenderSukukSummary';
  static const String renderSukukPosition = '/DirectFN/RenderSukukPosition';
  static const String getSukukTransactionByDate =
      'DirectFN/GetSukukTransactionByDate';
  static const String renderSecuritizationPosition =
      '/DirectFN/SecuritizationPosition';
  static const String renderSecuritizationTransactionReport =
      '/DirectFN/SecuritizationTransactionReport';
  static const String renderClosePosition = '/DirectFN/RenderClosePosition';
  static const String renderSecuritizationClosedPosition =
      '/DirectFN/SecuritizationClosedPositionReport';

  static const String updateBeneficiary = 'Benefeciary/UpdateBeneficiary';
  static const String viewTransfer = 'Transfer/Viewtransfer';
  static const String sukukPurchaseList = '/DirectFN/SukukPurchase';
  static var sellBuySukuk = "/DirectFN/SellBuySukuk";
  static var getComposition = "/DirectFN/sukukcomposition";
  static var getEquitiesComposition = "/DirectFN/equitiescomposition";
  static var getMarginFinance = "/DirectFN/MarginFinance";
  static var getLoanDetails = "/Auth/GetLoanDetails";

  static var paymentHistory = "/Auth/GetLoanHistory";
  static var getRIAAccounts = "/DirectFN/GetRIAACCOUNTs";
  static var generateKeyPair = "/Settings/GenerateKeyPair";

  static var specificFieldTypeValue =
      "/ResidentialInformation/SpecificFieldTypeValue";
  static var getStatement = "/FetchBalance/GetStatement";
  static var convertCurrencyfx = "/Transfer/convertCurrencyfx";

  static var inAppNotification = "/Notification/InAppNotification";

  static var getSecuritizationZakatHolding =
      "/DirectFN/GetSecuritizationZakatHolding";
  static var getSukukZakatHolding = "/DirectFN/GetSukukZakatHolding";
  static var getRIAZakat = "/DirectFN/GetRIAZakat";
  static var calculateZakah = "/DirectFN/CalculateZakah";
  static var registerSubUser = "/Auth/RegisterSubUserV2";
  static var sendSubUserOtp = "/Auth/SendSubUserOtp";
  static var fetchSubUser = "/Auth/FetchSubUser";
  static var pdplForm = "/Auth/PDPLForm";

  static String saveIdCard = "/IdCard/Save";
  static String getFieldValue = "/IdCard/GetListFieldValues";
  static var saveEmployeeDetail = "/AdditionalFieldsResp/SaveAdditionalFieldsResp";
  static var saveFatca = "/FatcaCrs/SetV2";
  static var saveQuestion = "/AgentQuestionair/AgentQuestionairResponse";
  static var updateKyc = "/Kyc/UpdateKyc";



  static var getProductForAccount = "/Libshara/GetProductForAccountOpeningV2";
  static var openOtherAccountRequest = "/Libshara/OpenOtherAccount";



  static var getWakalaProd = "/Wakala/GetWakalaProd";
  static var getWakalaGL = "/Wakala/GetWakalaGL";
  static var wakalaSendTransferOTP = "/Transfer/SendTransferOTP";
  static var openWakala = "/Wakala/OpenWakala";
  static var getAllCard = "/Auth/GetAllCards";
  static var getHoldCard = "/CreditCardApplication/GetAllHoldRequest";
  static var cardTransfer = "/Transfer/Transfers";
  static var getStatmentDate = "/CreditCardApplication/GetStatmentDate";
  static var downloadStatement = "/CreditCardApplication/DownloadStatement";
  static var convertCardBalance = "/CreditCardApplication/ConvertCardBalance";
  static var getOrderStatus = "/DirectFN/SellBuySukukDetails";
  static var fawateerGetBillers = "/Fawateer/GetAllBillersV2";
  static var sendMultiBillPaymnetOtp = "/Fawateer/SendMultiBillPaymentOTP";
  static var multiBillPaymentV2 = "/Fawateer/MultiBillPaymentV2";
  static var GetUserBills = "/Fawateer/GetUserBills";
  static var SaveBill = "/Fawateer/SaveBill";
  static var BillInquiry = "/Fawateer/BillInquiry";

  static var logout = "/Auth/Logout";



}
