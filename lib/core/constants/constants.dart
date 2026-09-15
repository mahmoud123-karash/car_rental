import 'package:flutter/material.dart';

Color appColor = const Color(0xFFECA400);
Color whiteColor = Colors.white;
Color blackColor = Colors.black;
Color gryColor = Colors.grey;

Size appSize(context) => MediaQuery.of(context).size;

const String apiKey = String.fromEnvironment(
  'MAPS_API_KEY',
  defaultValue: 'YOUR_MAPS_API_KEY_HERE',
);
String startLine =
    'For a seamless ride experience, book a taxi as a passenger or join as a driver to start earning on your own schedule.';

String appLink =
    'https://play.google.com/store/apps/details?id=com.example.cae_rental';

String appPrivacy =
    'https://www.freeprivacypolicy.com/live/a1e62b1a-513c-436b-aa66-cff524887a38';

String driverBox = 'driverBox';
String passengerBox = 'passengerBox';
String messageBox = 'messageBox';
