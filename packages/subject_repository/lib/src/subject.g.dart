// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subject _$SubjectFromJson(Map<String, dynamic> json) => _Subject(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  images: (json['images'] as Map<String, dynamic>).map(
    (k, e) => MapEntry($enumDecode(_$ImageTypeEnumMap, k), e as String),
  ),
  url: json['url'] as String?,
  summary: json['summary'] as String?,
);

Map<String, dynamic> _$SubjectToJson(_Subject instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'images': instance.images.map((k, e) => MapEntry(_$ImageTypeEnumMap[k]!, e)),
  'url': instance.url,
  'summary': instance.summary,
};

const _$ImageTypeEnumMap = {
  ImageType.large: 'large',
  ImageType.common: 'common',
  ImageType.medium: 'medium',
  ImageType.small: 'small',
  ImageType.grid: 'grid',
};

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

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);
