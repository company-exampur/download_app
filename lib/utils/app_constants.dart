import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'images.dart';



class AppConstants {



  static void showBottomMessage(context, message, bgColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      backgroundColor: bgColor,
      duration: Duration(milliseconds: 700),
    ));
  }


  static Widget noDataFound() {
    return Center(
      child: Image.asset(Images.no_data)
    );
  }





  static Future<void> checkPermission(BuildContext context, Permission permission, Function callback) async {
    var status = await permission.status;
    if (status.isGranted) {
      callback();
    } else {
      await permission.request().then((value) async {
        if(value.isGranted) {
          callback();
        } else {
          AppConstants.showBottomMessage(context, 'To download, allow permission', AppColors.black);
        }
      });
    }
  }

  static Future<void> goTo(BuildContext context, Widget route) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => route
        )
    );
  }

  static Future<void> goAndReplace(BuildContext context, Widget route) async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => route
        )
    );
  }

  // static const String COUNTRY_CODE = 'country_code';
  // static const String LANGUAGE_CODE = 'language_code';

}

class AppColors {

  static const Color amber       = Colors.amber;
  static const Color black       = Colors.black;
  static const Color white       = Colors.white;
  static const Color white24     = Colors.white24;
  static const Color white38     = Colors.white38;
  static const Color white54     = Colors.white54;
  static const Color red         = Colors.red;
  static const Color green       = Colors.green;
  static const Color yellow      = Colors.yellow;
  static const Color blue        = Colors.blue;
  static const Color orange      = Colors.orange;
  static const Color cyan        = Colors.cyan;
  static const Color blueGrey    = Colors.blueGrey;
  static const Color grey        = Colors.grey;
  static const Color transparent = Colors.transparent;

  static Color grey200 = Colors.grey[200]!;
  static Color grey300 = Colors.grey[300]!;
  static Color grey400 = Colors.grey[400]!;
  static Color grey500 = Colors.grey[500]!;
  static Color grey600 = Colors.grey[600]!;

  static Color brown400 = Colors.brown[400]!;

  static Color blue300 = Colors.blue[300]!;

  static const Color dark        = Color(0xFFd19d0f);
  static const Color jobAlert    = Color(0xFF14739c);
  static const Color darkOrange  = Color(0xFFf76d02);
  static const Color quiz        = Color(0xFF0582f7);
  static const Color affairs     = Color(0xFF7790a6);
  static const Color freeCourses = Color(0xFFf23587);
  static const Color one2one     = Color(0xFF069413);
  static const Color book        = Color(0xFF0b8f8d);
  static const Color paidCourses = Color(0xFFa807a8);
  static const Color series      = Color(0xFFd44242);
}

class StringConstant {

  static String appTutorial= 'app_tutorial';
  static String allFieldsMandatory= 'all_fields_mandatory';
  static String applyCoupon= 'apply_coupon';
  static String address= 'address';
  static String add= 'add';
  static String apply= 'apply';
  static String address_REQUIRED= 'address_REQUIRED';
  static String Age= 'age';
  static String attempthistory= 'attempt_history';
  static String audioOnly= 'audio_only';
  static String attemptQuiz= 'attempt_quiz';
  static String Alert= 'alert';

  static String books= 'books';
  static String buy= 'buy';
  static String buyCourse= 'buy_course';
  static String billingaddress= 'billing_address';
  static String book_name= 'book_name';
  static String BackToHomePage= 'back_to_home_page';
  static String BillNumber= 'bill_number';

  static String currentAffairs= 'current_affairs';
  static String chooseCategory= 'choose_category';
  static String city= 'city';
  static String confirmPassword= 'confirm_password';
  static String changePassword= 'change_password';
  static String currentPassword= 'current_password';
  static String continueToBuyCourse= 'continue_to_buy_course';
  static String continueToBuyBook= 'continue_to_buy_book';
  static String calculatorPage= 'calculator_page';
  static String calculate= 'calculate';
  static String CITY_REQUIRED= 'CITY_REQUIRED';
  static String country= 'country';
  static String coursename= 'course_name';
  static String CaBytes= 'ca_bytes';
  static String Class10= '10th_class';
  static String Class12= '12th_class';
  static String ConfirmPasswordNotMatched= 'confirm_password_is_not_matched';
  static String clickHereToViewPDF= 'click_view_PDF';
  static String center= 'center';
  static String Course= 'course';
  static String callUs= 'call_us';
  static String cancel= 'cancel';
  static String Continue= 'continue';

  static String downloads= 'downloads';
  static String dailyQuiz= 'daily_quiz';
  static String demo= 'demo';
  static String demo_classes= 'demo_classes';
  static String downloadVideo= 'download_video';
  static String DateofPurchase= 'date_of_purchase';


  static String graduation= 'graduation';

  static String email= 'email';
  static String exampurOne2one= 'exampur_one2one';
  static String eligibilityCalculator= 'eligibility_calculator';
  static String enterFirstName= 'enter_first_name';
  static String enterYourLastName= 'enter_your_last_name';
  static String enterPhoneNumber= 'enter_phone_number';
  static String enterLandmark= 'enter_landmark';
  static String enterAddress= 'enter_address';
  static String enterCity= 'enter_city';
  static String enterState= 'enter_state';
  static String enterPinCode= 'enter_pin_code';
  static String enteryourage= 'enter_your_age';
  static String EnterApplycoupon= 'Enter_valid_coupon_apply';
  static String Email_Required= 'email_required';
  static String emailUs= 'email_us';


  static String freeCourses= 'free_courses';
  static String firstName= 'first_name';
  static String fresher= 'fresher';
  static String facingProblemInApplication= 'facing_problem_in_application';

  static String hello= 'hello';
  static String home= 'home';
  static String homePage= 'home_page';
  static String help= 'help';
  static String helpAndFeedback= 'help_and_feedback';

  static String issueSubmittedSuccessfully= 'issue_submitted_successfully';
  static String itemType= 'item_type';

  static String lastName= 'last_name';
  static String logOut= 'log_out';
  static String landmarkTehsil= 'landmark';
  static String languagePreferences= 'language_preferences';
  static String LearningClosetPvt= 'Learning Closet Pvt. Ltd. (Exampur)';
  static String LiveChat= 'live_chat';

  static String paidCourse= 'paid_course';
  static String pleaseChooseTheCategory= 'please_choose_the_category';
  static String phoneNumber= 'phone_number';
  static String pinCode= 'pin_code';
  static String use_coupon= 'use_coupon';
  static String provideFurtherDetailsForDeliveryOfBooks= 'provide_further_details_for_delivery_of_books';
  static String preference= 'preference';
  static String PromoCode_REQUIRED= 'PromoCode_REQUIRED';
  static String pincode_REQUIRED= 'pincode_REQUIRED';
  static String paynow= 'pay_now';
  static String pleaseselectqualification= 'please_select_qualification';
  static String Postgraduation= 'post_graduation';
  static String PleaseSelectState= 'please_select_state';
  static String pleaseSelectAttemptHistory= 'please_select_attempt_history';
  static String pleaseEnterAge= 'please_enter_age';
  static String PaymentMode= 'payment_mode';
  static String priceBreakdown= 'price_breakdown';
  static String Price= 'price';
  static String Pricegst= 'price';
  static String placeOrder= 'place_order';
  static String PleaseletterPassword= 'please_letter_password';
  static String PleaseEnternewPassword= 'please_enter_new_password';
  static String PleasecurrentPassword= 'please_enter_current_password';
  static String Pleaseverifyyourphoneno = 'please_verify_your_phone_no.';

  static String name= 'name';
  static String newPassword= 'new_password';
  static String newBatch= 'new_batch';
  static String next= 'next';
  static String Name_Field_Required= 'name_field_required';
  static String noData= 'no_data';
  static String noLiveStreamPresent= 'no_live_stream_present';
  static String Normal= 'normal';

  static String testCourses= 'test_courses';
  static String TotalAmount= 'total_amount';
  static String TransactionReceipt= 'transaction_receipt';
  static String Thankyou= 'thank_you';
  static String TranscationId= 'transcation_id';
  static String TermsandConditions= 'Terms and Conditions.';
  static String ThisitemnonRefundable= 'This item is non-refundable.';
  static String TypeYourDoubtHere= 'type_your_doubt_here';

  static String offlineBatches= 'offline_batches';
  static String OrderDate= 'order_date';

  static String jobAlerts= 'job_alerts';

  static String submitIssue= 'submit_issue';
  static String studyMaterials= 'study_materials';
  static String serverError= 'server_error';
  static String settings= 'settings';
  static String shareNow= 'share_now';
  static String selectCategories= 'select_categories';
  static String searchCategory= 'search_category';
  static String state= 'state';
  static String selectLanguage= 'select_language';
  static String security= 'security';
  static String saveProfile= 'save_profile';
  static String saveTheCourse= 'save_the_course';
  static String share= 'share';
  static String skip= 'skip';
  static String State_Required= 'state_REQUIRED';
  static String sellingPrice= 'selling_price';
  static String selectissue= 'select_issue';
  static String showless= 'show_less';
  static String showmore= 'show_more';
  static String StudentName= 'student_name';
  static String selectSubject= 'select_subject';
  static String selectChapter= 'select_chapter';
  static String Send= 'send';

  static String viewPdf= 'view_pdf';

  static String watchAppTutorial= 'watch_app_tutorial';
  static String writeAboutTheProblem= 'write_about_the_problem';
  static String watch= 'watch';

  static String myPurchase= 'my_purchase';
  static String myTimetable= 'my_timetable';
  static String myCourses= 'my_courses';

  static String rateUs= 'rate_us';
  static String recorded= 'recorded';
  static String repeater= 'repeater';

  static String general= 'general';

  static String userName= 'user_name';
  static String UpdatedSuccessfully= 'updated_successfully';

  static String viewDetails= 'view_details';
  static String viewAll= 'view_all';
  static String view= 'view';
  static String viewInvoice= 'view_invoice';
  static String Validity= 'validity';

  static String qualification= 'qualification';

}