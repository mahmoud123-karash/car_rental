import 'package:car_rental/features/passenger/ride/domain/entities/time_entity.dart';

import 'row.dart';

class TravelModel extends TimeEntity {
  List<dynamic>? destinationAddresses;
  List<dynamic>? originAddresses;
  List<Row>? rows;
  String? status;

  TravelModel({
    this.destinationAddresses,
    this.originAddresses,
    this.rows,
    this.status,
  }) : super(
          time: rows?[0].elements?[0].duration?.text ?? '',
        );

  factory TravelModel.fromJson(Map<String, dynamic> json) => TravelModel(
        destinationAddresses: json['destination_addresses'] as List<dynamic>?,
        originAddresses: json['origin_addresses'] as List<dynamic>?,
        rows: (json['rows'] as List<dynamic>?)
            ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'destination_addresses': destinationAddresses,
        'origin_addresses': originAddresses,
        'rows': rows?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
