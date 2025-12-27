import 'dart:async';

import 'package:cms/cms.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

@freezed
abstract class S<T> with _$S<T> {
  const factory S({required PagingState<int, T> pages, String? tag}) = _S<T>;
}

@freezed
sealed class A with _$A {
  const factory A.fetch() = _Fetch;
  const factory A.search(String query) = _Search;
  const factory A.refresh() = _Refresh;
  const factory A._$1(int page) = _Fetch$;
}

class M<T> extends Cms<S<T>, A> {
  final Future<List<T>> Function(int pageKey, String? query) fetch;
  final void Function(String)? onSearch;

  M({required this.fetch, this.onSearch}) : super(S(pages: .new()));
  // dart format off
  @override
  Future<S<T>?> kernel(S<T> s, A a) async => switch (a) {
    _Fetch   _ => () {
                    if (s.pages.isLoading || !s.pages.hasNextPage) return null;

                    final page = s.pages.lastPageIsEmpty 
                                ? null 
                                : s.pages.nextIntPageKey;
                    if (page == null) {
                      return s.copyWith(pages: s.pages.copyWith(hasNextPage: false));
                    }
                    add(_Fetch$(page));
                    return s.copyWith(pages: s.pages.copyWith(isLoading: true));
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
                    add(_Fetch());
                    onSearch?.call(a.query);
                    return S<T>(pages: .new(), tag: a.query);
                  }(),
    _Refresh _ => () {
                    add(_Fetch());
                    return S<T>(pages: .new(), tag: s.tag);
                  }(),
  };
  // dart format on
}

@freezed
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
    // TODO: rm
    // print("GetSuggestions.call(query: $query)");
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
