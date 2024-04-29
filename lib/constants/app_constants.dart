

import 'package:aquaventure/core/models/language_model.dart';

class AppConstants {
  static const String loggedIn = 'loggedIn';
  static const String emailId = 'emailId';
  static const String userId = 'userId';
  static const String name = 'name';
  static const String profilePic = 'profilePic';
  static const String profileKey = 'profilePicKey';
  static const String completedProfile = 'completedProfile';
  static const String rememberMe = 'rememberMe';
  static const String loading = 'Loading...';
  static const String backToGroup = "BACK TO MY GROUP";
  static const String shareCard = "SHARE CARD";
  static const String withoutSharing = "CONTINUE WITHOUT SHARING";
  static const String passwordUpdates = "Password updated successfully";
  static const String linkedGroupMember = "Successfully Linked Group Member";
  static const String linkedCreditCard = "Credit Card Successfully Linked";
  static const String successfullySetPin = "Successfully Set Pin";
  static const String successfullyUpdated = "Successfully Updated!";
  static const String successfullyReset = "Successfully Reset!";
  static const String successfullyLinked = "Successfully Linked!";
  static const String shareCCLabel = "Would you like to share your linked card with a group member?";
  static const String shareCCDescription  = "Your group member is now able to use the same amazing cashless experience as you. \n \n Remember... you’ve set a daily spending limit for them. If they reach this limit you can always increase it in the My Group section.";
  static const String updatedDailyLimitLabel = "You have successfully updated your payment amount";
  static const String setPinLabel = "You have successfully shared your linked card";
  static const String chooseLocker = 'Choose locker for keep your belongings';
  static const String done = "DONE";
  static const String link = "LINK";
  static const String linkAquaband = "Link Aquaband";
  static const String manuallyEnter = "MANUALLY ENTER CODE";
  static const String choosePhoto = "Choose your photo";
  static const String nickname = "Nickname";
  static const String setPin = "setPin";
  static const String aquabandNumber = "Aquaband Number";
  static const String enterCode = "Enter Code";
  static const String noGroupMember = "No Group Member";
  static const String noGroupMemberInfo = "There is no group member attached to your account. Please add your group member by using the button below.";
  static const String manageBandInfo = "Manage your Aquabands";
  static const String cartItems = "cartItems";

  ///Launch Darkly Flags
  static const String ldEcommFlag = "mobile-ecomm-flag";
  static const String ldWayfindingFlag = "wayfinding_flag";

  static const String EXPLORE = 'Explore';
  static const String GROUPS = 'My Group';
  static const String MAP = 'Map';
  static const String SEARCH = 'Search';
  static const String RIDE_WAIT_TIMES = "Ride Wait Times";
  static const String MAP_SEARCH = 'Find people & view ride wait times';

  static const String UPLOAD_PASS = "Upload Pass";
  static const String ADD_MEMBERS = 'Add Group Member';
  static const String SCAN_OR_CODE = "Scan QR Code";
  static const String SCAN_PASS_LABEL = "The bar code can be found on \nyour confirmation email";

  static const String SCAN_CODE_LABEL = "This can be found on the back \nof your Aquaband wristband";
  static const String OTP_VERIFICATION = "OTP Verification";
  static const String OTP_LOGIN_INFO = "Please enter OTP sent to registered email and mobile";
  static const String OTP_REGISTRATION_INFO = "Please enter the OTP sent to registered email";
  static const String RIDES_DESCRIPTION = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";

  static const String CONFIRM = "CONFIRM";
  static const String RESET_PASSWORD = "Reset Password";
  static const String FORGOT_PASSWORD_INFO = "Please enter your Username and Email Address.  You will receive your password via an email message.";
  static const String CHECK_EMAIL_INFO = "Check your email to reset your password.";
  static const String LOGIN_INFO = "Please enter your details.";
  static const String REGISTRATION_INFO = "Please complete the details below to register your account.";
  static const String REQUEST_OTP = "REQUEST OTP";
  static const String FEEDBACK = 'Feedback';
  static const String PRIVACY_POLICY = 'Privacy Policy';
  static const String TERMS_CONDITIONS = 'Terms and Conditions';
  static const String TERMS_CONDITIONS_INFO = "To personalize your experience, we collect the following personal information: e-mail, zip code, gender, name, park location and identification numbers.  If you add an image to your profile or buy a photo or video, this data is also collected. By clicking Agree, you agree to the collection of this data, our Terms and Conditions, End User Agreement and Privacy Policy.  \n \nFor further details on how your data is used and stored, visit our Privacy Policy. To change your consent, or to edit or delete your data, visit the Settings section of this application. ";
  static const String PARENTAL_CONSENT = "Parent Consent";
  static const String PARENTS_INFO = "Based on the age entered we understand that you may be under the age of 13. Please note that anyone under the age of 13 requires parental consent to use the application.\n \nAny minor’s data collected is only used in the functionality of the app and is not used for any marketing material.\n \nPlease make sure your parent or guardian views this message and agrees to the terms below before you continue using the app.\n \nYou are able to delete your account at any point by going to settings.\n";
  static const String PARENTS_TERMS = "I confirm that I am the parent/ guardian of this user and that I consent to the Terms & Conditions on behalf of this user and that this user is using this app under my direct supervision.";
  static const String PARENTS_LABEL = "In order to obtain parental consent, please fill in the fields below.";
  static const String NOTIFICATION_LABEL = "Set up notifications and let us know how you would like us to notify you.";
  static const String CLOSE = 'CLOSE';
  static const String GO_CASHLESS = 'Go Cashless!';
  static const String CASHLESS_PAYMENTS = 'Cashless Payments';
  static const String TRANSACTION_HISTORY = 'Transaction History';
  static const String LINK_CREDIT_CARD = 'LINK CREDIT CARD';
  static const String DELINK_CREDIT_CARD = 'DELINK CREDIT CARD';
  static const String LINK_CARD_LABEL = 'Link your credit card for \na cashless experience';
  static const String AGREE = 'I AGREE';
  static const String securityLabel = "Set a 4 digit Aquaband Pin to make \n cashless transactions in the park.";
  static const String createPin = "CREATE AQUABAND PIN";
  static const String confirmPin = "CONFIRM PIN";
  static const String tryAgain = "TRY AGAIN";
  static const String noTransactions = "No Transactions";
  static const String deletedPartyMember = "Group member removed successfully.";
  static const String noTransactionsInfo = "You have not made any transactions yet";
  static const String FAILED_IMAGE_UPLOAD = "Failed to upload the image. Please try again";
  static const String DELETE_PARTY_MEMBER_ERROR = "Failed to delete party member. Please try again";
  static const String FAILED_WAIT_TIMES = "Failed to find attraction detail";
  static const String NO_DETAIL_FOUND = "No detail found!";
  static const String REMOVE_DAILY_LIMIT_ERROR = "Failed to remove shared credit card. Please try again";
  static const String DELETE_CC_ERROR = "Failed to delete credit card. Please try again";
  static const String TRANSACTIONS_ERROR = "Failed to get transactions, Please try again";
  static const String CREDIT_CARD_LINKED = "Credit card linked successfully. Please set pin for your credit card";
  static const String CREDIT_CARD_FAILED = "Credit card rejected, please try again";
  static const String FAILED_CC_SESSION = "Failed to open credit card form, please try again";
  static const String USER_NOT_FOUND = "User not found, please check credentials";
  static const String UPLOAD_PASS_FAILED = "Failed to upload the pass, please try again";
  static const String SOMETHING_WENT_WRONG = "Something went wrong";
  static const String noCCStatus = "You don't have any linked credit card. Please linked your credit card first";
  static const String INVALID_MOBILE_NUMBER = "Please enter a valid mobile number";
  static const String NO_INTERNET_CONNECTION = "No internet connection";
  static const String USER_DETAIL_NOT_FOUND = "User detail not exist.";
  static const String PASSES_ERROR = "Failed to get pass details. Please try again.";
  static const String EMPTY_PASSES = "No passes found.";
  static const String ADD_ON_ERROR = "Failed to get add-on details. Please try again ";
  static const String HOLD_ITEM_ERROR = "Failed to add item in cart. Please try again ";
  static const String UNHOLD_ITEM_ERROR = "Failed to remove item from cart. Please try again ";
  static const String ORDER_DETAIL_ERROR = "Failed to get order details. Please try again ";
  static const String PAYMENT_ERROR = "Failed to complete the transaction. Please try again ";
  static const String RIDE_WAIT_TIMES_ERROR = "Failed to get ride wait times. Please try again ";
  static const String IMAGE_UPLOAD_FAILED = "Image upload failed. Please try again";
  static const String USER_DETAILS_FAILED = "Failed to fetch user details. Please try again";
  static const String FAILED_PARTY_MEMBER = "Failed to add party member. Please try again";
  static const String FAILED_SET_PIN = "Failed to set pin for credit card, please try again";
  static const String DATA_FAILED = "Data Loading Failed.";
  static const String NO_CC_ERROR = "You don't have any linked credit card. Please linked your credit card first";
  static const String ALREADY_SHARED_CC_ERROR = "This party member has credit card info saved under another party. Please choose another member or remove their existing card.";
  static const String IOS_APP_URL = 'https://apps.apple.com/in/app/aquaventure-dubai/id6448394589';
  static const String ANDROID_APP_URL = 'https://play.google.com/store/apps/details?id=com.atlantis.aquaventure';
  static const String TERMS_CONDITIONS_URL = 'https://www.aquaventureworld.com/plan-your-visit/aquaband/terms-and-conditions-app';
  static const String FEEDBACK_URL = 'https://survey.reviewpro.com/feedback/survey/YVSLiO3XHlVfzGq7';
  static const String PRIVACY_URL = 'https://www.atlantis.com/dubai/privacy-policy-aquaband-aquaventure';
  static const String passwordError = "Please enter a password with at least 8 characters, including 1 lowercase letter, 1 uppercase letter, 1 special character, and 1 number.";
  static const String waitingForPayment = "Waiting for payment confirmation";
  static const String SKIA_FONT = "Skia";
  static const String AVERTAPE_FONT = "AvertaPE";
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: "",
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    // LanguageModel(
    //     imageUrl: Images.arabic,
    //     languageName: 'Arabic',
    //     countryCode: 'SA',
    //     languageCode: 'ar'),
  ];

  static Map<String, String?> addOnsDescriptionsMap = {
    "AquaXpress": "Slide more and wait less from any Guest Services Kiosk.",
    "Locker Large" : "Secure your items at Atlas Village, Barracudas or Main Entrance",
    "Locker Small" : "Secure your items at Atlas Village, Barracudas or Main Entrance",
    "Locker Mini" : "Secure your items at Atlas Village, Barracudas or Main Entrance",
    "Towel" : "Dry in style from any Guest Services Kiosk",
    "Meal Deal": "Chill with a delicious meal from Barracudas or Snappers",
    "Meal Deal Deluxe" : "Chill with a delicious meal from Barracudas or Snappers, plus a scoop of ice cream",
    "Premium Seating Barracuda" : "Add a little luxury to your adventure, located at Barracudas",
    "Premium Seating Cove" : "Add a little luxury to your adventure, located at Splashers Cove",
    "Premium Seating Torrent" : "Add a little luxury to your adventure, located at Torrent Beach",
  };

}