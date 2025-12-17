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
  const AniSearch({
    super.key,
    this.onChanged,
    this.debounceTime,
    required this.getSuggestions,
  });

  @Preview(name: 'Simple AniSearch', size: Size(400, 100))
  static Widget simple() => Viewport(
    offset: .zero(),
    slivers: [
      AniSearch(
        getSuggestions: (query) => const ["Suggestion 1", "Suggestion 2"],
      ),
    ],
  );

  final ValueChanged<String>? onChanged;
  final Duration? debounceTime;
  final List<String> Function(String) getSuggestions;

  @override
  State<AniSearch> createState() => _AniSearchState();
}

class _AniSearchState extends State<AniSearch> {
  final SearchController _searchController = SearchController();

  // 因为 SearchBar 才是核心，所以它作为最终的 child
  // 其他的都是装饰，提示也是装饰，所以放到 via 里面
  @override
  Widget build(BuildContext context) =>
      via((Widget c) => SliverToBoxAdapter(child: c))
          .via((Widget c) => Padding(padding: const .all(16.0), child: c))
          .via(
            (Widget c) => SearchAnchor(
              searchController: _searchController,
              viewOnSubmitted: (value) {
                widget.onChanged?.call(value);
                _searchController.closeView(value);
              },
              suggestionsBuilder: (context, controller) => widget
                  .getSuggestions(controller.text)
                  .map(
                    (suggestion) => ListTile(
                      title: Text(suggestion),
                      onTap: () {
                        controller.closeView(suggestion);
                        widget.onChanged?.call(suggestion);
                      },
                    ),
                  ),
              viewShape: RoundedRectangleBorder(borderRadius: .circular(12)),
              builder: (context, controller) => c,
            ),
          ) >
      SearchBar(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: .circular(12)),
        ),
        controller: _searchController,
        hintText: 'Search...',
        onTap: () => _searchController.openView(),
        onChanged: (_) => _searchController.openView(),
        leading: const Icon(Icons.search),
      );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
