import 'dart:async';

import 'package:cms/cms.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

@Freezed(
  map: .new(map: false, mapOrNull: false, maybeMap: false),
  when: .new(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class A with _$A {
  const factory A.fetch() = _Fetch;
  const factory A._fetch$(int page) = _Fetch$;
  const factory A.search(String query) = _Search;
  const factory A.refresh() = _Refresh;
}

@freezed
abstract class S<T> with _$S<T> {
  factory S.zero() => S(pages: .new());
  const factory S({required PagingState<int, T> pages, String? tag}) = _S<T>;
}

class M<T> extends Cms<S<T>, A> {
  final Future<List<T>> Function(int pageKey, String? query) fetch;
  final void Function(String)? onSearch;

  M({required this.fetch, this.onSearch}) : super(.zero());
  @override
  Future<S<T>?> kernel(S<T> s, A a) async => switch (a) {
    // dart format off
    _Fetch   _ => () {
                    if (s.pages.isLoading || !s.pages.hasNextPage) return null;

                    final page = s.pages.lastPageIsEmpty 
                                ? null 
                                : s.pages.nextIntPageKey;
                    if (page == null) {
                      return s.copyWith(pages: s.pages.copyWith(hasNextPage: false));
                    }
                    add(._fetch$(page)); // 真正的 fetch
                    return s.copyWith(pages: s.pages.copyWith(isLoading: true)); // 给外部观测
                  }(),
    _Fetch$  a => fetch(a.page, s.tag).then(
                    (items) => s.copyWith(
                      pages: s.pages.copyWith(
                        isLoading: false,
                        hasNextPage: items.isNotEmpty,
                        pages: [...?s.pages.pages, items],
                        keys: [...?s.pages.keys, a.page],
                      )
                    ),
                    onError: (error) => s.copyWith(
                      pages: s.pages.copyWith(isLoading: false, error: error)
                    ),
                  ),
    _Search  a => () {
                    add(.fetch());
                    onSearch?.call(a.query);
                    return S<T>.zero().copyWith(tag: a.query);
                  }(),
    _Refresh _ => () {
                    add(.fetch());
                    return S<T>.zero().copyWith(tag: s.tag);
                  }(),
    _          =>  undefined(s, a),
    // dart format on
  };
}

@Freezed(
  map: .new(map: false, mapOrNull: false, maybeMap: false),
  when: .new(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class Suggestion with _$Suggestion {
  const factory Suggestion.history(String value) = HistorySuggestion;
  const factory Suggestion.database(String value, {String? icon}) =
      DatabaseSuggestion;
}

class GetSuggestions {
  final FutureOr<List<HistorySuggestion>> Function(int) getHistory;
  final FutureOr<List<DatabaseSuggestion>> Function(String query, int)
  getDatabase;
  final int topK;

  const GetSuggestions({
    required this.getHistory,
    required this.getDatabase,
    this.topK = 10,
  });

  Future<List<Suggestion>> call(String? query) async {
    print("GetSuggestions.call(query: $query)");
    final history = await getHistory(topK);

    if (query == null || query.isEmpty) return history;
    // 优先搜索历史
    final historyMatched = history
        .where((e) => e.value.startsWith(query))
        .toList();
    // 然后增加数据库候选项
    final dbSuggestions = await getDatabase(
      query,
      topK - historyMatched.length,
    );
    return [...historyMatched, ...dbSuggestions];
  }
}
