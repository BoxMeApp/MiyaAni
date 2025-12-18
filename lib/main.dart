import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'models/bgm_model.dart';
// import 'package:miya_ani/screens/ani_shelf/view.dart';

@Preview(name: 'My Sample Text')
Widget mySampleText() {
  return const Text('Hello, World!');
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Scaffold(body: Center(
        child: CalendarWidget())),
    );
  }
}

@Preview(name: 'My Sample Calendar')
Widget mySampleCalendar() {
  return const CalendarWidget();
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late Future<List<CalendarItem>> futureCalendar;
  final BgmModel bgmModel = BgmModel();

  @override
  void initState() {
    super.initState();
    futureCalendar = bgmModel.fetchCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CalendarItem>>(
      future: futureCalendar,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available');
        } else {
          final calendars = snapshot.data!;
          return ListView.builder(
            itemCount: calendars.length,
            itemBuilder: (context, index) {
              final calendar = calendars[index];
              return ExpansionTile(
                title: Text(calendar.weekday),
                children: calendar.items
                    .map((item) => ListTile(
                          leading: Image.network(item.imageUrl),
                          title: Text(item.name),
                          onTap: () => launchURL(item.url),
                        ))
                    .toList(),
              );
            },
          );
        }
      },
    );
  }

  void launchURL(String url) {
    // Implement URL launching logic here
  }
}
