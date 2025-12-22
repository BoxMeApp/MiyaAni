import 'package:subject_repository/subject_repository.dart';
import 'package:test/test.dart';

void main() {
  group('SubjectRepository', () {
    final subjectRepository = SubjectRepository();
    const limit = 3;

    setUp(() {
      // Additional setup goes here.
    });

    group('getCalendar', () {
      test('fetchCalendar: expected 7 days a week', () async {
        final calendar = await subjectRepository.getCalendar();
        expect(calendar.length, 7);
      });

      test('CalendarItem has correct properties', () async {
        final calendar = await subjectRepository.getCalendar();
        for (var item in calendar) {
          expect(item.weekdayCn, isA<String>());
          expect(item.weekdayId, isA<int>());
          expect(item.items, isA<List<Subject>>());
        }
      });

      test('Subject has correct properties', () async {
        final calendar = await subjectRepository.getCalendar();
        final firstSubject = calendar.first.items.first;

        _checkCommonSubjectProperties(firstSubject);
        expect(firstSubject.url, isNotNull);

        print(firstSubject);
      });
    });

    group('searchSubjects', () {
      test(
        'search subjects with valid keyword, expect proper results',
        () async {
          final subjects = await subjectRepository.searchSubjects(
            '魔法少女',
            0,
            limit: limit,
          );
          expect(subjects, isNotEmpty);
          expect(subjects.length, lessThanOrEqualTo(limit));
        },
      );

      test(
        'Search subjects with different offset, expect different results',
        () async {
          final subject1 = await subjectRepository.searchSubjects(
            '魔法少女',
            0,
            limit: limit,
          );

          final subject2 = await subjectRepository.searchSubjects(
            '魔法少女',
            1,
            limit: limit,
          );

          expect(subject2[0], equals(subject1[1]));
          for (final subject in subject1) {
            expect(subject2[limit - 1], isNot(equals(subject)));
          }
        },
      );

      test(
        'searchSubjects with valid keyword, expect subject has correct properties',
        () async {
          final subjects = await subjectRepository.searchSubjects(
            '魔法少女',
            0,
            limit: limit,
          );
          final firstSubject = subjects.first;
          _checkCommonSubjectProperties(firstSubject);
          expect(firstSubject.summary, isA<String>());
          print(firstSubject);
        },
      );
    });

    group('getSubjects', () {
      test('getSubjects with valid parameters, expect has results', () async {
        final subjects = await subjectRepository.getSubjects(0, limit: limit);
        expect(subjects, isNotEmpty);
        expect(subjects.length, lessThanOrEqualTo(limit));
      });

      test(
        'Get subjects with different offset, expect different results',
        () async {
          final subject1 = await subjectRepository.getSubjects(0, limit: limit);
          final subject2 = await subjectRepository.getSubjects(1, limit: limit);

          expect(subject2[0], equals(subject1[1]));
          for (final subject in subject1) {
            expect(subject2[limit - 1], isNot(equals(subject)));
          }
        },
      );

      test(
        'getSubjects with valid parameters, expect subject has correct properties',
        () async {
          final subjects = await subjectRepository.getSubjects(0, limit: limit);
          final firstSubject = subjects.first;
          _checkCommonSubjectProperties(firstSubject);
          expect(firstSubject.summary, isA<String>());
          print(firstSubject);
        },
      );
    });
  });
}

void _checkCommonSubjectProperties(Subject subject) {
  expect(subject.id, isA<int>());
  expect(subject.nameJa, isA<String>());
  expect(subject.nameCn, isA<String>());
  expect(subject.images, isA<Map<ImageType, String>>());
}
