import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infix/via.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'dart:math' as math;

import 'cms.dart';

class AniShelfPage {
  @Preview(name: 'ColoredBox Shelf', size: Size(400, 300))
  static Widget $coloredBoxShelf() =>
      // controller
      via(
        (Widget c) => BlocProvider(
          create: (context) => M<Color>(
            (pageKey, _) => Future.delayed(
              const Duration(milliseconds: 500),
              () => .generate(
                21,
                (index) =>
                    Colors.primaries[math.Random().nextInt(
                      Colors.primaries.length,
                    )],
              ),
            ),
          ),
          child: c,
        ),
      ) >
      // view
      $AniShelfPage<Color>(
        builder: (item) =>
            ColoredBox(color: item, child: SizedBox(height: 100)),
      );
}

class $AniShelfPage<T> extends StatelessWidget {
  final Widget Function(T) builder;
  const $AniShelfPage({super.key, required this.builder});

  @override
  Widget build(BuildContext context) =>
      via(
        (Widget c) => SafeArea(child: c),
      ).via((List<Widget> c) => CustomScrollView(slivers: c)) >
      [
        const SliverToBoxAdapter(child: AniSearch()),
        SliverPadding(
          padding: const .all(8.0),
          sliver: AniShelfViewer<T>(builder: builder),
        ),
      ];
}

class AniSearch extends StatefulWidget {
  const AniSearch({super.key, this.onSubmit, this.getSuggestions});

  @Preview(name: 'AniSearch With Suggestions', size: Size(400, 100))
  static Widget $hasSuggestions() => AniSearch(
    getSuggestions: (query) => const ["Suggestion 1", "Suggestion 2"],
  );

  @Preview(name: 'AniSearch Without Suggestions', size: Size(400, 100))
  static Widget $noSuggestions() => AniSearch();

  final ValueChanged<String>? onSubmit;
  final List<String> Function(String)? getSuggestions;

  @override
  State<AniSearch> createState() => _AniSearchState();
}

class _AniSearchState extends State<AniSearch> {
  final SearchController _searchController = SearchController();

  bool get isShowSuggestions => widget.getSuggestions != null;

  // 因为 SearchBar 才是核心，所以它作为最终的 child
  // 其他的都是装饰，提示也是装饰，所以放到 decorator 里面
  @override
  Widget build(BuildContext context) =>
      via((Widget c) => Padding(padding: const .all(16.0), child: c)).via(
        (Widget c) => isShowSuggestions
            ? SearchAnchor(
                searchController: _searchController,
                viewOnSubmitted: (value) {
                  widget.onSubmit?.call(value);
                  _searchController.closeView(value);
                },
                suggestionsBuilder: (context, controller) => widget
                    .getSuggestions!
                    .call(controller.text)
                    .map(
                      (suggestion) => ListTile(
                        title: Text(suggestion),
                        onTap: () {
                          controller.closeView(suggestion);
                          widget.onSubmit?.call(suggestion);
                        },
                      ),
                    ),
                viewShape: RoundedRectangleBorder(borderRadius: .circular(12)),
                builder: (context, controller) => c,
              )
            : c,
      ) >
      SearchBar(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: .circular(12)),
        ),
        controller: _searchController,
        hintText: 'Search...',
        onTap: () {
          if (isShowSuggestions) {
            _searchController.openView();
          }
        },
        onChanged: (_) {
          if (isShowSuggestions) {
            _searchController.openView();
          }
        },
        leading: const Icon(Icons.search),
      );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

@Preview(name: "shelf viewer", size: Size(400, 200))
Widget exampleBoxShelf() {
  final controller = PagingController<int, ColoredBox>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => Future.delayed(
      const Duration(milliseconds: 500),
      () => .generate(
        21,
        (index) => ColoredBox(
          color: Colors
              .primaries[(pageKey * 21 + index) % Colors.primaries.length],
          child: SizedBox(),
        ),
      ),
    ),
  );
  return PagingListener(
    controller: controller,
    builder: (context, state, fetchNextPage) => PagedGridView<int, ColoredBox>(
      state: state,
      fetchNextPage: fetchNextPage,
      builderDelegate: .new(itemBuilder: (context, item, index) => item),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    ),
  );
}

class AniShelfViewer<T> extends StatelessWidget {
  final Widget Function(T) builder;
  const AniShelfViewer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => BlocBuilder<M<T>, S<T>>(
    builder: (context, state) => PagedSliverGrid<int, T>(
      state: state,
      fetchNextPage: () => context.read<M<T>>().add(const .fetch()),
      builderDelegate: .new(
        itemBuilder: (context, item, index) => builder(item),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    ),
  );
}
