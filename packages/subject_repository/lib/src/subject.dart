import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

/// 条目类型
enum SubjectType {
  book(1),
  anime(2),
  music(3),
  game(4),
  /// 3次元内容
  realWorld(6);

  const SubjectType(this.code);

  /// 条目类型对应 API enum 的数值
  final int code;
}

/// 动画类别
enum SubjectAnimeCategory {
  other(0),
  tv(1),
  /// Original Video Animation, 指直接以 DVD、蓝光等形式发行，未在电视上播放的动画
  ova(2),
  /// 动画电影（剧场版）
  movie(3),
  /// 在网络上播出的动画
  web(5);
  
  const SubjectAnimeCategory(this.code);

  /// 条目类型对应 API enum 的数值
  final int code;
}

/// 条目模型
@freezed
abstract class Subject with _$Subject {
  const Subject._();
  
  const factory Subject({
    /// 条目 id
    required int id,
    /// 条目名称(日文)
    @JsonKey(name: 'name')
    required String nameJa,
    /// 条目名称(中文)
    @JsonKey(name: 'name_cn')
    required String nameCn,
    /// 条目图像 URL，对应不同尺寸
    /// 
    /// 其中 [common] 为常规尺寸，介于 [large] 与 [medium] 之间，
    /// [grid] 为比 [small] 更小的尺寸，常用于缩略图
    required ({String large, String common, String medium, String small, String grid}) images,
    /// 条目链接地址
    String? url,
    /// 条目简介
    String? summary,
  }) = _Subject;  

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Subject && other.id == id;
  }
  
  @override
  int get hashCode => id.hashCode;  
}

/// 日历的一项，表示一个星期中某一天的番剧列表
@freezed
abstract class CalendarItem with _$CalendarItem {
  const CalendarItem._();
  
  const factory CalendarItem({
    /// 表示星期几的不同语言名称和 [id]，其中星期一的 [id] 为 1，星期日的 [id] 为 7
    required ({String cn, String en, String ja, int id}) weekday,
    /// 当天的番剧条目列表
    required List<Subject> items,
  }) = _CalendarItem;

  String get weekdayCn => weekday.cn;
  int get weekdayId => weekday.id;

  /// 从 JSON 创建 CalendarItem 实例
  factory CalendarItem.fromJson(Map<String, dynamic> json) =>
      _$CalendarItemFromJson(json);
}