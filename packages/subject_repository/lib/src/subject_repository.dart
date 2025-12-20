import 'dart:convert';

import 'package:http/http.dart' as http;

import 'subject.dart';

class SubjectRepository {
  static const String baseUrl = 'https://api.bgm.tv/';
  static const String userAgent =
      'BoxMeApp/MiyaApi/1.0.0 (Flutter) (https://github.com/BoxMeApp/MiyaAni)';

  /// 获取番剧时间表
  Future<List<CalendarItem>> getCalendar() async {
    final responseBody = await _getData('calendar');
    final List<dynamic> jsonData = jsonDecode(responseBody);
    return jsonData.map((json) => CalendarItem.fromJson(json)).toList();
  }

  /// 获取条目列表
  Future<List<Subject>> getSubjects(int limit, int offset) async {
    final String endpoint = 'v0/subjects?type=2&limit=$limit&offset=$offset';
    final data = await _getData(endpoint);
    final json = jsonDecode(data)['data'] as List<dynamic>;
    return json.map((item) => Subject.fromJson(item)).toList();
  }

  /// 搜索条目
  Future<List<Subject>> searchSubjects(
    String keyword,
    int limit,
    int offset, {
    bool nsfw = false,
  }) async {
    final uri = Uri.parse('${baseUrl}v0/search/subjects');
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
      'User-Agent': userAgent,
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  /// 发送GET请求并获取响应数据
  Future<String> _getData(String endpoint) async {
    final response = await http.get(
      Uri.parse(baseUrl + endpoint),
      headers: _buildHeaders(),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}