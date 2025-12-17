import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infix/via.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'cms.dart';

// class AniShelfPage extends StatelessWidget {
//   const AniShelfPage({super.key});

//   @override
//   Widget build(BuildContext context) =>
//       via(
//         (Widget c) => SafeArea(child: c),
//       ).via((List<Widget> c) => CustomScrollView(slivers: c)) >
//       [
//         PagedSliverAlignedGrid.extent(
//           state: state,
//           fetchNextPage: () => context.read<M>().add(const .fetch()),
//           builderDelegate: .new(
//             itemBuilder: (context, item, index) => Container(),
//           ),
//           maxCrossAxisExtent: maxCrossAxisExtent,
//         ),
//       ];
// }

class AniSearch extends StatefulWidget {
  const AniSearch({super.key, this.onSubmit, this.getSuggestions});

  @Preview(name: 'AniSearch With Suggestions', size: Size(400, 100))
  static Widget hasSuggestions() => AniSearch(
    getSuggestions: (query) => const ["Suggestion 1", "Suggestion 2"],
  );

  @Preview(name: 'AniSearch Without Suggestions', size: Size(400, 100))
  static Widget noSuggestions() => AniSearch();

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

@Preview(name: "shelf viewer")
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
          child: SizedBox(width: 100, height: 100),
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
