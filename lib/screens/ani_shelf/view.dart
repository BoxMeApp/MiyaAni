import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infix/via.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:miya_ani/widgets/ani_cover.dart';
import 'package:subject_repository/subject_repository.dart';
import 'dart:math' as math;

import 'cms.dart';

class AniShelfPage extends StatelessWidget {
  const AniShelfPage({super.key});

  static Widget test() => $coloredBoxShelf();

  @Preview(name: 'ColoredBox Shelf', size: Size(400, 300))
  static Widget $coloredBoxShelf() {
    final repo = FakeRepo();
    // controller
    return via(
          (Widget c) => BlocProvider(
            create: (context) => M<int>(repo.fakeFetch),
            child: c,
          ),
        ) >
        // view
        $AniShelfPage<int>(
          builder: (item) =>
              via((Widget c) => Card(child: c)) >
              Text(
                item.toString(),
                style: const TextStyle(fontSize: 24),
                textAlign: .center,
              ),
          getSuggestions: (query) => repo.fakeSuggestions(query),
        );
  }

  @override
  Widget build(BuildContext context) =>
      via(
        (Widget c) => BlocProvider(
          create: (context) => M<Subject>(RealRepo.of(context).fetch),
          child: c,
        ),
      ) >
      // view
      $AniShelfPage<Subject>(
        builder: (item) =>
            via((Widget c) => Card(child: c)) > AniCover(content: item),
        getSuggestions: (query) => RealRepo.of(context).getSuggestions(query),
      );
}

class FakeRepo {
  final database = List.generate(100, (index) => index);

  Future<List<String>> fakeSuggestions(String? query, [int topK = 10]) async {
    final history = [10, 22, 50].map((e) => e.toString()).toList();

    // 默认返回历史
    if (query == null || query.isEmpty) {
      return history.sublist(math.max(0, history.length - topK)).toList();
    }
    // 简单的包含匹配
    final results = database
        .map((e) => e.toString())
        .where((e) => e.contains(query))
        .toList();
    return results.sublist(0, math.min(results.length, topK)).toList();
  }

  Future<List<int>> fakeFetch(int pageKey, String? query) async {
    final relative = () {
      if (query == null || query.isEmpty) {
        return database;
      }
      return database.where((e) => e.toString().contains(query)).toList();
    }();
    await Future.delayed(const Duration(seconds: 1));
    return relative.skip((pageKey - 1) * 20).take(20).toList();
  }
}

class RealRepo {
  final SubjectRepository _subjectRepo;
  RealRepo.of(BuildContext context)
    : _subjectRepo = context.read<SubjectRepository>();

  Future<List<Subject>> fetch(int pageKey, String? query) {
    final offset = (pageKey - 1) * 10;
    if (query == null || query.isEmpty) {
      return _subjectRepo.getSubjects(offset, limit: 10);
    }
    return _subjectRepo.searchSubjects(query, offset, limit: 10);
  }

  Future<List<String>> getSuggestions(String? query, [int topK = 10]) async {
    final history = ['进击的巨人', '鬼灭之刃', '魔法少女'].take(topK).toList();

    // 默认返回历史
    if (query == null || query.isEmpty) {
      return history;
    }
    // 简单的包含匹配
    final results = await _subjectRepo.searchSubjects(query, 0, limit: topK);
    return results.map((e) => e.nameCn).toList();
  }
}

class $AniShelfPage<T> extends StatelessWidget {
  final Widget Function(T) builder;
  final Future<List<String>> Function(String? query) getSuggestions;
  const $AniShelfPage({
    super.key,
    required this.builder,
    required this.getSuggestions,
  });

  @override
  Widget build(BuildContext context) =>
      via((Widget c) => SafeArea(child: c)) >
      Scaffold(
        appBar: AniSearch(
          getSuggestions: getSuggestions,
          onSubmit: (v) => context.read<M<T>>().add(.search(v)),
        ),
        body:
            via(
              (Widget c) => RefreshIndicator(
                onRefresh: () async =>
                    context.read<M<T>>().add(const .refresh()),
                child: c,
              ),
            ).via((List<Widget> c) => CustomScrollView(slivers: c)) >
            [AniShelfViewer<T>(builder: builder)],
      );
}

class AniSearch extends StatefulWidget implements PreferredSizeWidget {
  const AniSearch({super.key, this.onSubmit, required this.getSuggestions});

  final ValueChanged<String>? onSubmit;

  final Future<List<String>> Function(String? query) getSuggestions;

  @override
  State<AniSearch> createState() => _AniSearchState();
  @override
  Size get preferredSize => const .fromHeight(kToolbarHeight);
}

class _AniSearchState extends State<AniSearch> {
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return via((Widget c) => Padding(padding: const .all(5.0), child: c)) >
        SearchAnchor.bar(
          barShape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: .circular(12)),
          ),
          barHintText: 'Search...',
          barLeading: const Icon(Icons.search),
          viewShape: RoundedRectangleBorder(borderRadius: .circular(12)),
          searchController: _searchController,
          onSubmitted: (value) {
            widget.onSubmit?.call(value);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FocusScope.of(context).unfocus();
            });
            _searchController.closeView(value);
          },
          suggestionsBuilder: (context, controller) => widget
              .getSuggestions(controller.text)
              .then(
                (items) => items
                    .map(
                      (e) => ListTile(
                        title: Text(e),
                        onTap: () {
                          controller.text = e;
                          widget.onSubmit?.call(e);
                          _searchController.closeView(e);
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    )
                    .toList(),
              ),
        );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class AniShelfViewer<T> extends StatelessWidget {
  final Widget Function(T) builder;
  const AniShelfViewer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<M<T>, S<T>, PagingState<int, T>>(
        selector: (s) => s.pages,
        builder: (context, state) => PagedSliverGrid<int, T>(
          state: state,
          fetchNextPage: () => context.read<M<T>>().add(const .fetch()),
          builderDelegate: .new(
            itemBuilder: (context, item, index) => builder(item),
          ),
          gridDelegate: isMobile(context)
              ? const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                )
              : const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
        ),
      );
}

bool isMobile(BuildContext context) => switch (Theme.of(context).platform) {
  .iOS || .android || .fuchsia => true,
  .macOS || .linux || .windows => false,
};
