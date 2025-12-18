import 'dart:convert';
import 'package:http/http.dart' as http;

class CalendarItem {
  final String weekday;
  final List<AnimeItem> items;
  const CalendarItem({required this.weekday, required this.items});

  factory CalendarItem.fromJson(Map<String, dynamic> json) {
    return CalendarItem(
      weekday: json['weekday']['cn'],
      items: (json['items'] as List)
          .map((item) => AnimeItem.fromJson(item))
          .toList(),
    );
  }
}

class AnimeItem {
  final int id;
  final String url;
  final String name;
  final String imageUrl;
  const AnimeItem({
    required this.id,
    required this.url,
    required this.name,
    required this.imageUrl,
  });

  factory AnimeItem.fromJson(Map<String, dynamic> json) {
    return AnimeItem(
      id: json['id'],
      url: json['url'],
      name: json['name_cn'],
      imageUrl: json['images']['common'],
    );
  }
}

class BgmModel {
  final String baseUrl = 'https://api.bgm.tv/';

  Future<String> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint));
    

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<CalendarItem>> fetchCalendar() async {
    final responseBody = await fetchData('calendar');
    final List<dynamic> jsonData = jsonDecode(responseBody);
    return jsonData.map((json) => CalendarItem.fromJson(json)).toList();
  }
}