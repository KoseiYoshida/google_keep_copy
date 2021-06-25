// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Content _$_$_ContentFromJson(Map<String, dynamic> json) {
  return _$_Content(
    title: json['title'] as String? ?? '',
    text: json['text'] as String? ?? '',
    imagePaths: json['imagePaths'].cast<String>() as List<String>,
  );
}

Map<String, dynamic> _$_$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'imagePaths': instance.imagePaths,
    };
