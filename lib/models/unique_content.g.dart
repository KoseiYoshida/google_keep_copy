// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unique_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UniqueContent _$_$_UniqueContentFromJson(Map<String, dynamic> json) {
  return _$_UniqueContent(
    id: UniqueContentId.fromJson(json['id'] as Map<String, dynamic>),
    content: Content.fromJson(json['content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UniqueContentToJson(_$_UniqueContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
    };
