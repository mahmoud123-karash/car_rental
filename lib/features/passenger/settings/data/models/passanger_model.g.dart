// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passanger_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassangerModelAdapter extends TypeAdapter<PassangerModel> {
  @override
  final int typeId = 2;

  @override
  PassangerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PassangerModel(
      email: fields[4] as String,
      name: fields[0] as String,
      phone: fields[1] as String,
      job: fields[2] as String,
      gender: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PassangerModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.job)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassangerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
