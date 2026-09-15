import 'package:car_rental/core/cache/save_data.dart';
import 'package:car_rental/core/cache/shared_preference.dart';
import 'package:car_rental/core/constants/constants.dart';
import 'package:car_rental/core/shared/assets.dart';
import 'package:car_rental/features/driver/home/data/models/request_model/request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../features/passenger/settings/data/models/passanger_model.dart';

void openUri({required Uri url}) async {
  await launchUrl(url).then((value) {
    if (kDebugMode) {
      print(value);
    }
  });
}

Future<void> share({
  required String title,
  required String text,
}) async {
  await Share.share(
    '$text\n$appLink',
    subject: title,
  );
}

void returedOffline() {
  String uid = CacheHelper.getData(key: 'uid');
  FirebaseFirestore.instance.collection('Drivers').doc(uid).update(
    {
      'online': false,
    },
  );
}

IconData getIcon(value) {
  if (value == 'Gym') {
    return Icons.fitness_center_outlined;
  } else if (value == 'Home') {
    return Icons.home;
  } else if (value == 'Work') {
    return Icons.work;
  } else {
    return Icons.favorite;
  }
}

Future showAppBottomSheet(
  context,
  widget, {
  bool isDismissible = true,
}) {
  return showModalBottomSheet(
    context: context,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    constraints: BoxConstraints(
      maxWidth: appSize(context).height / 2,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (context) => widget,
  );
}

void logout() {
  var box = Hive.box<PassangerModel>(passengerBox);
  box.clear();
  CacheHelper.removeData(key: 'uid');
}

void savefPaymentMethod(index) {
  if (index == 0) {
    savePaymentMethod('Card');
  } else if (index == 1) {
    savePaymentMethod('Paypal');
  } else {
    savePaymentMethod('Cash');
  }
}

String getMethodImage(method) {
  if (method == 'Card') {
    return Assets.imagesCard;
  } else if (method == 'Paypal') {
    return Assets.imagesPaypal;
  } else {
    return Assets.imagesCash;
  }
}

String getDriverRating(List<num> rating) {
  num value = rating.isEmpty
      ? 0.0
      : rating
              .map((element) => element.toDouble())
              .reduce((value, element) => value + element) /
          rating.length;

  return value.toStringAsFixed(1);
}

String getEarings(List<RequestModel> completedRides) {
  int earings = 0;
  for (var element in completedRides) {
    String extractedNumber = element.price.substring(1);
    int number = int.parse(extractedNumber);
    earings += number;
  }
  return earings.toString();
}
