import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

@JsonEnum()
enum ImageType {
  large,
  common,
  medium,
  small,
  grid,
}

@freezed
abstract class Subject with _$Subject {
  const factory Subject({
    required int id,
    required String name,
    required Map<ImageType, String> images,
    String? url,
    String? summary,
  }) = _Subject;  

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
abstract class CalendarItem with _$CalendarItem {
  const CalendarItem._();
  
  const factory CalendarItem({
    required Map<String, dynamic> weekday,
    required List<Subject> items,
  }) = _CalendarItem;

  String get weekdayCn => weekday['cn'] ?? '';
  int get weekdayId => weekday['id'] ?? 0;

  factory CalendarItem.fromJson(Map<String, dynamic> json) =>
      _$CalendarItemFromJson(json);
}