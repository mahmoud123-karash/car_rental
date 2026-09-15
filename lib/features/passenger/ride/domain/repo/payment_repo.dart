import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentRepo {
  void updatePaumentMethod({
    required String method,
    required String uid,
  }) async {
    await FirebaseFirestore.instance.collection('Rides').doc(uid).update(
      {
        'paymentMethod': method,
      },
    );
  }
}
