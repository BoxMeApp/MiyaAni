import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPrefs {
  final SharedPreferencesWithCache _prefs;

  LocalPrefs._(this._prefs);

  static Future<LocalPrefs> create() async => ._(
    await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    ),
  );

  static const _kSearchHistory = 'search_history';
  late final searchHistory = SearchHistory(
    _prefs.getStringList(_kSearchHistory) ?? [],
    onChanged: (items) => _prefs.setStringList(_kSearchHistory, items),
  );

  static const _kLocale = 'locale';
  final _locale = StreamController<Locale?>.broadcast();
  Stream<Locale?> get locale$ => _locale.stream;
  Locale? get locale {
    final localeString = _prefs.getString(_kLocale);
    if (localeString == null) return null;
    return localeFromString(localeString);
  }

  set locale(Locale? value) {
    if (value == null) {
      _prefs.remove(_kLocale);
    } else {
      _prefs.setString(_kLocale, value.toString());
    }
    _locale.add(value);
  }
}

class SearchHistory {
  final int maxSize;
  final Queue<String> _items;
  final void Function(List<String>)? onChanged;

  SearchHistory(List<String> init, {this.maxSize = 10, this.onChanged})
    : _items = .of(init) {
    // 截断到最大容量
    while (_items.length > maxSize) {
      _items.removeLast();
    }
  }

  void add(String keyword) {
    final k = keyword.trim();
    if (k.isEmpty) return;

    // 去重
    _items.remove(k);

    // 最新放前面
    _items.addFirst(k);

    // 超出容量，丢弃最旧
    if (_items.length > maxSize) {
      _items.removeLast();
    }
    onChanged?.call(_items.toList());
  }

  List<String> getLatest(int k) {
    if (k <= 0) return const [];
    if (k >= _items.length) {
      return List.unmodifiable(_items);
    }
    return _items.take(k).toList(growable: false);
  }

  /// 只读
  List<String> get items => List.unmodifiable(_items);
}

@visibleForTesting
Locale? localeFromString(String localeString) {
  final parts = localeString.split('_');

  return switch (parts.length) {
    1 => Locale(parts[0]),
    2 => Locale(parts[0], parts[1]),
    _ => null,
  };
}
