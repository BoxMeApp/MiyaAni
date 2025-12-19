import 'package:cms/cms.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms.freezed.dart';

@freezed
sealed class A with _$A {
  const factory A.fetch() = Fetch;
  // 设计不一致导致的
  // see: https://github.com/BoxMeApp/MiyaAni/issues/4
  @internal
  const factory A.$fetch(int page) = _$Fetch;
  const factory A.search(String query) = Search;
}

@freezed
abstract class S<T> with _$S<T> {
  factory S.zero() => S(pages: .new());
  const factory S({required PagingState<int, T> pages, String? tag}) = _S<T>;
}

class M<T> extends Cms<S<T>, A> {
  final Future<List<T>> Function(int pageKey, String? query) _fetch;

  M(this._fetch) : super(.zero());
  @override
  Future<S<T>?> kernel(S<T> s, A a) async => switch (a) {
    // dart format off
    Fetch   _ =>  () {
                    if (s.pages.isLoading || !s.pages.hasNextPage) return null;

                    final page = s.pages.lastPageIsEmpty 
                                ? null 
                                : s.pages.nextIntPageKey;
                    if (page == null) {
                      return s.copyWith(pages: s.pages.copyWith(hasNextPage: false));
                    }
                    add(.$fetch(page)); // 真正的 fetch
                    return s.copyWith(pages: s.pages.copyWith(isLoading: true)); // 给外部观测
                  }(),
    _$Fetch a =>  _fetch(a.page, s.tag).then(
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

    _         =>  undefined(s, a),
    // dart format on
  };
}
