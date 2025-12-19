import 'package:subject_repository/subject_repository.dart';

void main() async {
  final subjectRepo = SubjectRepository();

  final calendar = await subjectRepo.getCalendar();
  print('Fetched ${calendar.length} days in calendar.');

  final searchResults = await subjectRepo.searchSubjects("魔法少女", 10, 0);
  print('Search returned ${searchResults.length} subjects.');
}
