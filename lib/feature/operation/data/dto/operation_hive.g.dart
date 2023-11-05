// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OperationHiveAdapter extends TypeAdapter<OperationHive> {
  @override
  final int typeId = 0;

  @override
  OperationHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OperationHive(
      note: fields[6] as String,
      id: fields[0] as int,
      date: fields[1] as String,
      type: fields[2] as String,
      category: fields[3] as String,
      sum: fields[4] as int,
      underCategory: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OperationHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.sum)
      ..writeByte(5)
      ..write(obj.underCategory)
      ..writeByte(6)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OperationHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
