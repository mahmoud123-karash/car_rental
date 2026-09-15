// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverEntityAdapter extends TypeAdapter<DriverEntity> {
  @override
  final int typeId = 0;

  @override
  DriverEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverEntity(
      driverImage: fields[3] as String?,
      driverJob: fields[4] as String?,
      driverBirth: fields[5] as String?,
      driverGender: fields[6] as String?,
      driverName: fields[0] as String?,
      deiverEmail: fields[1] as String?,
      driverPhone: fields[2] as String?,
      driverCar: fields[7] as CarModel?,
      completed: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, DriverEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.driverName)
      ..writeByte(1)
      ..write(obj.deiverEmail)
      ..writeByte(2)
      ..write(obj.driverPhone)
      ..writeByte(3)
      ..write(obj.driverImage)
      ..writeByte(4)
      ..write(obj.driverJob)
      ..writeByte(5)
      ..write(obj.driverBirth)
      ..writeByte(6)
      ..write(obj.driverGender)
      ..writeByte(7)
      ..write(obj.driverCar)
      ..writeByte(8)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
