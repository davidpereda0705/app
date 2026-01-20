// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacte.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContacteAdapter extends TypeAdapter<Contacte> {
  @override
  final int typeId = 1;

  @override
  Contacte read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contacte(
      nom: fields[0] as String,
      telefon: fields[1] as String,
      email: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Contacte obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.telefon)
      ..writeByte(2)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContacteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
