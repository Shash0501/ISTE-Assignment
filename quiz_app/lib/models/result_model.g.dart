// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultModelAdapter extends TypeAdapter<ResultModel> {
  @override
  final int typeId = 1;

  @override
  ResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultModel(
      subject: fields[0] as String,
      correctanswers: fields[1] as int,
      marks: fields[2] as int,
      playerName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ResultModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.correctanswers)
      ..writeByte(2)
      ..write(obj.marks)
      ..writeByte(3)
      ..write(obj.playerName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
