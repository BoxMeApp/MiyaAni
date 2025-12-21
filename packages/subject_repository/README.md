<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

Provide subject fetching operation through Bangumi REST API.

## Features

- Fetch subject calendar.
- Search subjects by keywords.

## Usage

```dart
final repo = SubjectRepository();
final subjects = repo.searchSubjects("魔法少女", 10, 0);  // search with keyword "魔法少女", and return at most 10 results.
print('Search returned ${subjects.length} subjects.');
```

## Credits

- All the operation is based on [Bangumi API](https://github.com/bangumi/api)
