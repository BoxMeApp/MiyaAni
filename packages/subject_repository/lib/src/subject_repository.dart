import 'dart:convert';

import 'package:http/http.dart' as http;

import 'subject.dart';

/// 用于获取条目相关数据的 repository
class SubjectRepository {
  static const String _baseUrl = 'https://api.bgm.tv/';
  static const String _userAgent =
      'BoxMeApp/MiyaApi/1.0.0 (Flutter) (https://github.com/BoxMeApp/MiyaAni)';

  /// 获取番剧时间表
  /// 
  /// 返回一周七天的番剧时间表，每天包含对应的番剧条目列表。
  Future<List<CalendarItem>> getCalendar() async {
    final responseBody = await _getData('calendar');
    final List<dynamic> jsonData = jsonDecode(responseBody);
    return jsonData.map((json) => CalendarItem.fromJson(json)).toList();
  }

  /// 获取条目列表
  /// 
  /// 返回偏移 [offset] 处至多 [limit] 个条目。
  /// 
  /// 应注意有以下关系，且与 [limit] 为多少无关：
  /// ```dart
  /// getSubjects(0)[offset] == getSubjects(offset)[0]
  /// ```
  Future<List<Subject>> getSubjects(int offset, {int limit = 10}) async {
    final String endpoint = 'v0/subjects?type=2&limit=$limit&offset=$offset';
    final data = await _getData(endpoint);
    final json = jsonDecode(data)['data'] as List<dynamic>;
    return json.map((item) => Subject.fromJson(item)).toList();
  }

  /// 搜索条目
  /// 
  /// 以 [keyword] 为关键词搜索条目，并从中返回偏移 [offset] 处至多 [limit] 个条目。
  /// 参数 [nsfw] (not safe for work)指示是否包含成人向条目，因为获取 NSFW 内容需要提供用户 token，目前并不支持。
  /// 
  /// 应注意有以下关系，且与 [limit] 为多少无关：
  /// ```dart
  /// searchSubjects(keyword, 0)[offset] == searchSubjects(keyword, offset)[0]
  /// ```
  Future<List<Subject>> searchSubjects(
    String keyword,
    int offset, {
    int limit = 10,
    bool nsfw = false,
  }) async {
    final uri = Uri.parse('${_baseUrl}v0/search/subjects?limit=$limit&offset=$offset');
    final requestbody = jsonEncode(<String, dynamic>{
      'keyword': keyword,
      'sort': 'rank',
      'filter': {
        'type': [SubjectType.anime.code],
        'nsfw': nsfw,
      },
    });
    final response = await http.post(
      uri,
      headers: _buildHeaders(),
      body: requestbody,
      encoding: Encoding.getByName('utf-8'),
    );

    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> items = jsonData['data'];
        return items.map((item) => Subject.fromJson(item)).toList();

      case 400:
        final resBody = jsonDecode(response.body);
        final title = resBody['title'] ?? 'Bad Request';
        final detail = resBody['description'] ?? 'The request was invalid.';
        throw Exception('$title: $detail');
      default:
        throw Exception('Failed to search subjects: ${response.statusCode}');
    }
  }

  /// 构建请求头
  Map<String, String> _buildHeaders() {
    return {
      'User-Agent': _userAgent,
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  /// 发送GET请求并获取响应数据
  Future<String> _getData(String endpoint) async {
    final response = await http.get(
      Uri.parse(_baseUrl + endpoint),
      headers: _buildHeaders(),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}