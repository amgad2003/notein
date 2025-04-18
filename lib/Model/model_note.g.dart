// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelNoteAdapter extends TypeAdapter<ModelNote> {
  @override
  final int typeId = 0;

  @override
  ModelNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelNote(
      title: fields[0] as String,
      subTitle: fields[1] as String,
      date: fields[2] as String,
      color: fields[3] as int,
      isFavorite: fields[4] as bool,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelNote obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.isFavorite)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
