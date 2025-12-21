import 'package:subject_repository/subject_repository.dart';
import 'package:test/test.dart';

void checkCommonSubjectProperties(Subject subject) {
  expect(subject.id, isA<int>());
  expect(subject.name, isA<String>());
  expect(subject.images, isA<Map<ImageType, String>>());
}

void main() {
  group('SubjectRepository.fetchCalendar', () {
    final subjectRepository = SubjectRepository();

    setUp(() {
      // Additional setup goes here.
    });

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

      checkCommonSubjectProperties(firstSubject);
      expect(firstSubject.url, isNotNull);

      print(firstSubject);
    });
  });

  group('searchSubjects', () {
    final subjectRepository = SubjectRepository();

    test('searchSubjects with valid keyword, expect has results', () async {
      final subjects = await subjectRepository.searchSubjects('魔法少女', 0, limit: 10);
      expect(subjects, isNotEmpty);
      expect(subjects.length, lessThanOrEqualTo(10));
    });

    test('searchSubjects with valid keyword, expect subject has correct properties', () async {
      final subjects = await subjectRepository.searchSubjects('魔法少女', 0, limit: 10);
      final firstSubject = subjects.first;
      checkCommonSubjectProperties(firstSubject);
      expect(firstSubject.summary, isA<String>());
      print(firstSubject);
    });
  });

  group('getSubjects', () {
    final subjectRepository = SubjectRepository();

    test('getSubjects with valid parameters, expect has results', () async {
      final subjects = await subjectRepository.getSubjects(0, limit: 5);
      expect(subjects, isNotEmpty);
      expect(subjects.length, lessThanOrEqualTo(5));
    });

    test('getSubjects with valid parameters, expect subject has correct properties', () async {
      final subjects = await subjectRepository.getSubjects(0, limit: 5);
      final firstSubject = subjects.first;
      checkCommonSubjectProperties(firstSubject);
      expect(firstSubject.summary, isA<String>());
      print(firstSubject);
    });
  });
}
