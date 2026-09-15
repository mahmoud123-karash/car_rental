import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final Timestamp time;
  final String rideUid;
  final String rideStatus;
  final String price;
  final String sAddress;
  final String dAddress;
  final String paymentMethod;
  final double latS;
  final double latD;
  final double lngS;
  final double lngD;
  final bool isPayed;
  final bool isHere;
  final bool isArrived;
  final String driverUid;
  final String passengerUid;

  HistoryModel({
    required this.rideUid,
    required this.dAddress,
    required this.sAddress,
    required this.price,
    required this.isHere,
    required this.isPayed,
    required this.isArrived,
    required this.rideStatus,
    required this.latS,
    required this.latD,
    required this.lngS,
    required this.lngD,
    required this.driverUid,
    required this.passengerUid,
    required this.paymentMethod,
    required this.time,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        time: json['time'] ?? Timestamp.now(),
        rideUid: json['rideUid'] ?? '',
        sAddress: json['sAddress'] ?? '',
        isPayed: json['isPayed'] ?? false,
        isHere: json['isHere'] ?? false,
        isArrived: json['isArrived'] ?? false,
        dAddress: json['dAddress'] ?? '',
        price: json['price'] ?? '',
        rideStatus: json['rideStatus'] ?? '',
        paymentMethod: json['paymentMethod'] ?? '',
        latD: json['latD'] ?? 0,
        lngS: json['lngS'] ?? 0,
        latS: json['latS'] ?? 0,
        lngD: json['lngD'] ?? 0,
        driverUid: json['driverUid'] ?? '',
        passengerUid: json['passengerUid'] ?? '',
      );
}
