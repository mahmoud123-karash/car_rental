// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Try Again`
  String get trya {
    return Intl.message(
      'Try Again',
      name: 'trya',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get try_again {
    return Intl.message(
      'Try Again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Please finish last ride first`
  String get last_ride_note {
    return Intl.message(
      'Please finish last ride first',
      name: 'last_ride_note',
      desc: '',
      args: [],
    );
  }

  /// `OnTrack`
  String get app_name {
    return Intl.message(
      'OnTrack',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get field_required {
    return Intl.message(
      'This field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Soon`
  String get soon {
    return Intl.message(
      'Soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `For a seamless ride experience, book a taxi as a passenger or join as a driver to start earning on your own schedule.`
  String get onboarding_description {
    return Intl.message(
      'For a seamless ride experience, book a taxi as a passenger or join as a driver to start earning on your own schedule.',
      name: 'onboarding_description',
      desc: '',
      args: [],
    );
  }

  /// `Passenger`
  String get passenger {
    return Intl.message(
      'Passenger',
      name: 'passenger',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get driver {
    return Intl.message(
      'Driver',
      name: 'driver',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login_btn {
    return Intl.message(
      'LOGIN',
      name: 'login_btn',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in to continue.`
  String get login_subtitle {
    return Intl.message(
      'Please sign in to continue.',
      name: 'login_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `EMAIL`
  String get email {
    return Intl.message(
      'EMAIL',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `PASSWORD`
  String get password {
    return Intl.message(
      'PASSWORD',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgot_password_q {
    return Intl.message(
      'Forget Password?',
      name: 'forgot_password_q',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get sign_up_btn {
    return Intl.message(
      'SIGN UP',
      name: 'sign_up_btn',
      desc: '',
      args: [],
    );
  }

  /// `Login Successfully`
  String get login_success {
    return Intl.message(
      'Login Successfully',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the input below here.`
  String get register_subtitle {
    return Intl.message(
      'Please fill the input below here.',
      name: 'register_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `FULL NAME`
  String get full_name {
    return Intl.message(
      'FULL NAME',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `PHONE`
  String get phone {
    return Intl.message(
      'PHONE',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account!`
  String get already_have_account {
    return Intl.message(
      'Already have an account!',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Register Successfully`
  String get register_success {
    return Intl.message(
      'Register Successfully',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `SEND EMAIL`
  String get send_email {
    return Intl.message(
      'SEND EMAIL',
      name: 'send_email',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email`
  String get check_your_email {
    return Intl.message(
      'Please check your email',
      name: 'check_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Current Location`
  String get current_location {
    return Intl.message(
      'Current Location',
      name: 'current_location',
      desc: '',
      args: [],
    );
  }

  /// `Where you want to go?`
  String get where_to_go {
    return Intl.message(
      'Where you want to go?',
      name: 'where_to_go',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Book Ride`
  String get book_ride {
    return Intl.message(
      'Book Ride',
      name: 'book_ride',
      desc: '',
      args: [],
    );
  }

  /// `Change Pick Up Point`
  String get change_pick_up_point {
    return Intl.message(
      'Change Pick Up Point',
      name: 'change_pick_up_point',
      desc: '',
      args: [],
    );
  }

  /// `Please pick the location first`
  String get pick_location_first {
    return Intl.message(
      'Please pick the location first',
      name: 'pick_location_first',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get select_payment_method {
    return Intl.message(
      'Select Payment Method',
      name: 'select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment method`
  String get please_select_payment_method {
    return Intl.message(
      'Please select payment method',
      name: 'please_select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `No Available Drivers`
  String get no_available_drivers {
    return Intl.message(
      'No Available Drivers',
      name: 'no_available_drivers',
      desc: '',
      args: [],
    );
  }

  /// `Cancel The Ride`
  String get cancel_the_ride {
    return Intl.message(
      'Cancel The Ride',
      name: 'cancel_the_ride',
      desc: '',
      args: [],
    );
  }

  /// `Find another driver`
  String get find_another_driver {
    return Intl.message(
      'Find another driver',
      name: 'find_another_driver',
      desc: '',
      args: [],
    );
  }

  /// `Request The Driver`
  String get request_the_driver {
    return Intl.message(
      'Request The Driver',
      name: 'request_the_driver',
      desc: '',
      args: [],
    );
  }

  /// `The driver cancelled your ride`
  String get driver_cancelled_ride {
    return Intl.message(
      'The driver cancelled your ride',
      name: 'driver_cancelled_ride',
      desc: '',
      args: [],
    );
  }

  /// `Please wait until the driver accept your ride`
  String get wait_for_driver_accept {
    return Intl.message(
      'Please wait until the driver accept your ride',
      name: 'wait_for_driver_accept',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Add name of the {address} place`
  String add_place_name(String address) {
    return Intl.message(
      'Add name of the $address place',
      name: 'add_place_name',
      desc: '',
      args: [address],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Please type the name first`
  String get please_enter_name_first {
    return Intl.message(
      'Please type the name first',
      name: 'please_enter_name_first',
      desc: '',
      args: [],
    );
  }

  /// `Driver is here`
  String get driver_is_here {
    return Intl.message(
      'Driver is here',
      name: 'driver_is_here',
      desc: '',
      args: [],
    );
  }

  /// `The Driver will arrive in`
  String get driver_will_arrive_in {
    return Intl.message(
      'The Driver will arrive in',
      name: 'driver_will_arrive_in',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `How is your trip?`
  String get how_is_your_trip {
    return Intl.message(
      'How is your trip?',
      name: 'how_is_your_trip',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback will help improve driving experience`
  String get rating_feedback_hint {
    return Intl.message(
      'Your feedback will help improve driving experience',
      name: 'rating_feedback_hint',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get submit_review {
    return Intl.message(
      'Submit Review',
      name: 'submit_review',
      desc: '',
      args: [],
    );
  }

  /// `Please rate the trip`
  String get please_rate_trip {
    return Intl.message(
      'Please rate the trip',
      name: 'please_rate_trip',
      desc: '',
      args: [],
    );
  }

  /// `Trip Details`
  String get trip_details {
    return Intl.message(
      'Trip Details',
      name: 'trip_details',
      desc: '',
      args: [],
    );
  }

  /// `Pick Up Location`
  String get pick_up_location {
    return Intl.message(
      'Pick Up Location',
      name: 'pick_up_location',
      desc: '',
      args: [],
    );
  }

  /// `Destination`
  String get destination {
    return Intl.message(
      'Destination',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Public Settings`
  String get public_settings {
    return Intl.message(
      'Public Settings',
      name: 'public_settings',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Rate The App`
  String get rate_app {
    return Intl.message(
      'Rate The App',
      name: 'rate_app',
      desc: '',
      args: [],
    );
  }

  /// `Share App`
  String get share_app {
    return Intl.message(
      'Share App',
      name: 'share_app',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get about_app {
    return Intl.message(
      'About App',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Hello, `
  String get hello {
    return Intl.message(
      'Hello, ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Overall earning`
  String get overall_earning {
    return Intl.message(
      'Overall earning',
      name: 'overall_earning',
      desc: '',
      args: [],
    );
  }

  /// `Today Requests`
  String get today_requests {
    return Intl.message(
      'Today Requests',
      name: 'today_requests',
      desc: '',
      args: [],
    );
  }

  /// `Completed Rides`
  String get completed_rides {
    return Intl.message(
      'Completed Rides',
      name: 'completed_rides',
      desc: '',
      args: [],
    );
  }

  /// `Today Rides`
  String get today_rides {
    return Intl.message(
      'Today Rides',
      name: 'today_rides',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `New Request `
  String get new_request {
    return Intl.message(
      'New Request ',
      name: 'new_request',
      desc: '',
      args: [],
    );
  }

  /// `New Requests`
  String get new_requests {
    return Intl.message(
      'New Requests',
      name: 'new_requests',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get view_all {
    return Intl.message(
      'View all',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle`
  String get vehicle {
    return Intl.message(
      'Vehicle',
      name: 'vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Step {step} Of 3`
  String step_of_three(int step) {
    return Intl.message(
      'Step $step Of 3',
      name: 'step_of_three',
      desc: '',
      args: [step],
    );
  }

  /// `Please select your car brand`
  String get select_car_brand {
    return Intl.message(
      'Please select your car brand',
      name: 'select_car_brand',
      desc: '',
      args: [],
    );
  }

  /// `Please select your car color`
  String get select_car_color {
    return Intl.message(
      'Please select your car color',
      name: 'select_car_color',
      desc: '',
      args: [],
    );
  }

  /// `Car Model`
  String get car_model {
    return Intl.message(
      'Car Model',
      name: 'car_model',
      desc: '',
      args: [],
    );
  }

  /// `Manufacture Year`
  String get manufacture_year {
    return Intl.message(
      'Manufacture Year',
      name: 'manufacture_year',
      desc: '',
      args: [],
    );
  }

  /// `Arrived`
  String get arrived {
    return Intl.message(
      'Arrived',
      name: 'arrived',
      desc: '',
      args: [],
    );
  }

  /// `Start Trip`
  String get start_trip {
    return Intl.message(
      'Start Trip',
      name: 'start_trip',
      desc: '',
      args: [],
    );
  }

  /// `End Trip`
  String get end_trip {
    return Intl.message(
      'End Trip',
      name: 'end_trip',
      desc: '',
      args: [],
    );
  }

  /// `The passenger must pay to start pickup`
  String get passenger_must_pay {
    return Intl.message(
      'The passenger must pay to start pickup',
      name: 'passenger_must_pay',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
