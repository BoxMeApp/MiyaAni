import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

enum SubjectType {
  book(1),
  anime(2),
  music(3),
  game(4),
  realWorld(6);

  const SubjectType(this.code);
  final int code;
}

enum SubjectAnimeCategory {
  other(0),
  tv(1),
  ova(2),
  movie(3),
  web(5);

  final int code;
  const SubjectAnimeCategory(this.code);
}

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