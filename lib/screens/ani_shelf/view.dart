import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infix/flutter_infix.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:miya_ani/l10n/generated/localizations.dart';
import 'package:subject_repository/subject_repository.dart';

import 'package:miya_ani/widgets/ani_cover.dart';
import 'package:miya_ani/repositories/local_prefs.dart';
import 'package:miya_ani/utils/preview.dart';
import 'cms.dart';

class AniShelfPage extends StatelessWidget {
  const AniShelfPage({super.key});

  static Widget test() => $coloredBoxShelf();

  @AppPreview(name: 'ColoredBox Shelf', size: Size(400, 300))
  static Widget $coloredBoxShelf() {
    final repo = FakeRepo();
    // controller
    return wrap(
          (c) => BlocProvider(
            create: (context) => M<int>(fetch: repo.fakeFetch),
            child: c,
          ),
        ) >
        // view
        $AniShelfPage<int>(
          builder: (item) =>
              wrap((c) => Card(child: c)) >
              Text(
                item.toString(),
                style: const TextStyle(fontSize: 24),
                textAlign: .center,
              ),
          getSuggestions: GetSuggestions(
            getHistory: (topK) => [
              10,
              22,
              50,
            ].take(topK).map((e) => HistorySuggestion(e.toString())).toList(),
            getDatabase: (query, topK) => repo.fakeSuggestions(query, topK),
          ).call,
        );
  }

  @override
  Widget build(BuildContext context) =>
      wrap(
        (c) => BlocProvider(
          create: (context) => M<Subject>(
            fetch: RealRepo.of(context).fetch,
            onSearch: (v) => context.read<LocalPrefs>().searchHistory.add(v),
          ),
          child: c,
        ),
      ) >
      // view
      $AniShelfPage<Subject>(
        builder: (item) => AniCover(content: item),
        getSuggestions: GetSuggestions(
          getHistory: (topK) => context
              .read<LocalPrefs>()
              .searchHistory
              .getLatest(topK)
              .map((e) => HistorySuggestion(e))
              .toList(),
          getDatabase: RealRepo.of(context).getSuggestions,
        ).call,
      );
}

class FakeRepo {
  final database = List.generate(100, (index) => index);

  Future<List<DatabaseSuggestion>> fakeSuggestions(
    String? query,
    int topK,
  ) async {
    if (query == null || query.isEmpty) {
      return database
          .take(topK)
          .map((e) => DatabaseSuggestion(e.toString()))
          .toList();
    }
    return database
        .map((e) => e.toString())
        .where((e) => e.contains(query))
        .take(topK)
        .map((e) => DatabaseSuggestion(e))
        .toList();
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

  Future<List<DatabaseSuggestion>> getSuggestions(
    String? query,
    int topK,
  ) async {
    final results = query == null || query.isEmpty
        ? await _subjectRepo.getSubjects(0, limit: topK)
        : await _subjectRepo.searchSubjects(query, 0, limit: topK);
    return results
        .map(
          (e) => DatabaseSuggestion(
            e.nameCn.isNotEmpty ? e.nameCn : e.nameJa,
            icon: e.images.small,
          ),
        )
        .toList();
  }
}

class $AniShelfPage<T> extends StatelessWidget {
  final Widget Function(T) builder;
  final Future<List<Suggestion>> Function(String? query) getSuggestions;
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
            wrap(
              (c) => RefreshIndicator(
                onRefresh: () async =>
                    context.read<M<T>>().add(const .refresh()),
                child: c,
              ),
            ) >
            CustomScrollView(slivers: [AniShelfViewer<T>(builder: builder)]),
      );
}

class AniSearch extends StatefulWidget implements PreferredSizeWidget {
  const AniSearch({super.key, this.onSubmit, required this.getSuggestions});

  final ValueChanged<String>? onSubmit;

  final Future<List<Suggestion>> Function(String? query) getSuggestions;

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
          barHintText: AppLocalizations.of(context)!.search,
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
                      (e) => SuggestionTile(
                        e,
                        onTap: () {
                          controller.text = e.value;
                          widget.onSubmit?.call(e.value);
                          _searchController.closeView(e.value);
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

class SuggestionTile extends StatelessWidget {
  final Suggestion content;
  final void Function()? onTap;
  const SuggestionTile(this.content, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: switch (content) {
        HistorySuggestion _ => const Icon(Icons.history, size: 20),
        DatabaseSuggestion d =>
          d.icon != null
              ? Image.network(
                  d.icon!,
                  width: 20,
                  height: 20,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 20),
                )
              : const Icon(Icons.search, size: 20),
      },
      title: Text(content.value),
      onTap: onTap,
    );
  }
}
