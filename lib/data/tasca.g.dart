// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasca.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TascaAdapter extends TypeAdapter<Tasca> {
  @override
  final int typeId = 0;

  @override
  Tasca read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tasca(
      titol: fields[0] as String,
      completada: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Tasca obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.titol)
      ..writeByte(1)
      ..write(obj.completada);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TascaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
