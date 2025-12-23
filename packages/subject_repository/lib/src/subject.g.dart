// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subject _$SubjectFromJson(Map<String, dynamic> json) => _Subject(
  id: (json['id'] as num).toInt(),
  nameJa: json['name'] as String,
  nameCn: json['name_cn'] as String,
  images: _$recordConvert(
    json['images'],
    ($jsonValue) => (
      common: $jsonValue['common'] as String,
      grid: $jsonValue['grid'] as String,
      large: $jsonValue['large'] as String,
      medium: $jsonValue['medium'] as String,
      small: $jsonValue['small'] as String,
    ),
  ),
  url: json['url'] as String?,
  summary: json['summary'] as String?,
);

Map<String, dynamic> _$SubjectToJson(_Subject instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.nameJa,
  'name_cn': instance.nameCn,
  'images': <String, dynamic>{
    'common': instance.images.common,
    'grid': instance.images.grid,
    'large': instance.images.large,
    'medium': instance.images.medium,
    'small': instance.images.small,
  },
  'url': instance.url,
  'summary': instance.summary,
};

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);

_CalendarItem _$CalendarItemFromJson(Map<String, dynamic> json) =>
    _CalendarItem(
      weekday: _$recordConvert(
        json['weekday'],
        ($jsonValue) => (
          cn: $jsonValue['cn'] as String,
          en: $jsonValue['en'] as String,
          id: ($jsonValue['id'] as num).toInt(),
          ja: $jsonValue['ja'] as String,
        ),
      ),
      items: (json['items'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CalendarItemToJson(_CalendarItem instance) =>
    <String, dynamic>{
      'weekday': <String, dynamic>{
        'cn': instance.weekday.cn,
        'en': instance.weekday.en,
        'id': instance.weekday.id,
        'ja': instance.weekday.ja,
      },
      'items': instance.items,
    };
