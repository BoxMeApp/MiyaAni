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

final class S<T> extends PagingStateBase<int, T> {
  final String? tag;
  S({
    super.pages,
    super.keys,
    super.error,
    super.hasNextPage,
    super.isLoading,
    this.tag,
  });

  S.zero() : tag = null, super();

  @override
  S<T> copyWith({
    Defaulted<List<List<T>>?>? pages = const Omit(),
    Defaulted<List<int>?>? keys = const Omit(),
    Defaulted<Object?>? error = const Omit(),
    Defaulted<bool>? hasNextPage = const Omit(),
    Defaulted<bool>? isLoading = const Omit(),
    Defaulted<String?>? tag = const Omit(),
  }) => S<T>(
    pages: pages is Omit ? this.pages : pages as List<List<T>>?,
    keys: keys is Omit ? this.keys : keys as List<int>?,
    error: error is Omit ? this.error : error,
    hasNextPage: hasNextPage is Omit ? this.hasNextPage : hasNextPage as bool,
    isLoading: isLoading is Omit ? this.isLoading : isLoading as bool,
    tag: tag is Omit ? this.tag : tag as String?,
  );
}

class M<T> extends Cms<S<T>, A> {
  final Future<List<T>> Function(int pageKey, String? search) _fetchFn;

  M(this._fetchFn) : super(.zero());
  @override
  Future<S<T>?> kernel(S<T> s, A a) async => switch (a) {
    // dart format off
    Fetch   _ =>  () {
                    if (s.isLoading || !s.hasNextPage) return null;

                    final page = s.lastPageIsEmpty ? null : s.nextIntPageKey;
                    if (page == null) {
                      return s.copyWith(hasNextPage: false);
                    }
                    add(.$fetch(page)); // 真正的 fetch
                    return s.copyWith(isLoading: true); // 给外部观测
                  }(),
    _$Fetch a =>  _fetchFn(a.page, s.tag).then(
                    (items) => s.copyWith(
                      isLoading: false,
                      hasNextPage: items.isNotEmpty,
                      pages: [...?state.pages, items],
                      keys: [...?state.keys, a.page],
                    ),
                    onError: (error) => s.copyWith(isLoading: false, error: error),
                  ),
    _         =>  undefined(s, a),
    // dart format on
  };
}
