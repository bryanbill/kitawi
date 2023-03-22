#!/usr/bin/env dart

import 'dart:io';
import 'package:args/args.dart';

/// This is a Dart program that uses the ArgParser library to parse
/// command-line arguments. The program defines two commands
/// (`create` and `run`) and two options (`port` and `name`).
void main(List<String> args) async {
  late ArgParser parser;
  try {
    parser = ArgParser()
      ..addCommand('create')
      ..addCommand('run')
      ..addOption('port',
          abbr: 'p',
          help: 'The port to run the app on.',
          valueHelp: 'port',
          defaultsTo: '8080')
      ..addOption("name",
          help: 'The name of the app to create.',
          valueHelp: 'name-of-app',
          defaultsTo: 'kitawi-app');

    final results = parser.parse(args);
    if (results.command == null) {
      print(parser.usage);
      exit(1);
    } else {
      if (results.command?.name == 'create') {
        await create(results['name']);
      }

      if (results.command?.name == 'run') {
        final port = int.parse(results['port']);
        await run(port);
      }
    }
  } catch (e) {
    print(e.toString());
    print(parser.usage);
    exit(1);
  }
}

/// This function creates a new Dart web app using the `dart create` command.
/// It then adds the kitawi dependency to the pubspec.yaml file and runs
/// `pub get` to install the kitawi dependency.
Future<void> create(String name) async {
  // Enable webdev
  final webdev =
      await Process.start('dart', ['pub', 'global', 'activate', 'webdev']);

  // Pipe the output of the webdev command to stdout
  webdev.stdout.listen((event) {
    stdout.add(event);
  });

  // Pipe the error output of the webdev command to stderr
  webdev.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the webdev command to finish
  await webdev.exitCode;

  // dart create web app
  final create = await Process.start('dart', ['create', '-t' 'web', name]);

  // Pipe the output of the create command to stdout
  create.stdout.listen((event) {
    stdout.add(event);
  });

  // Pipe the error output of the create command to stderr
  create.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the create command to finish
  await create.exitCode;

  // scaffold the app
  scaffold(name);

  // Change directory to the newly created app
  Directory.current = name;

  // Add kitawi: any as a dependency in pubspec.yaml
  final pubspec = File('pubspec.yaml');

  // Read the contents of the pubspec.yaml file
  final contents = await pubspec.readAsString();

  // get the version of kitawi from contents
  // final version = contents.split('version: ')[1].split('\n')[0];

  // Add kitawi: any as a dependency
  final updatedContents =
      contents.replaceFirst('dependencies:', 'dependencies:\n  kitawi: ^0.0.4');

  // Write the updated contents to the pubspec.yaml file
  await pubspec.writeAsString(updatedContents);

  // Run pub get to install the kitawi dependency
  final pubGet = await Process.start('dart', ['pub', 'get']);

  // Pipe the output of the pub get command to stdout
  pubGet.stdout.listen((event) {
    stdout.add(event);
  });

  // Pipe the error output of the pub get command to stderr
  pubGet.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the pub get command to finish
  await pubGet.exitCode;
}

/// This function runs the web app using the `webdev serve` command.
/// It takes the port to run the app on as an argument.
/// The default port is 8080.
Future<void> run(int port) async {
  // Run webdev serve
  final webdev = await Process.start(
      'webdev', ['serve', 'web:$port', '--auto', 'refresh']);

  // Pipe the output of the webdev command to stdout
  webdev.stdout.listen((event) {
    stdout.add(event);
  });

  // Pipe the error output of the webdev command to stderr
  webdev.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the webdev command to finish
  await webdev.exitCode;
}

/// This function is used to scaffold a new kitawi app.
/// It takes the name of the app as an argument.
void scaffold(String name) {
  try {
    // delete the index.html, style.css, and main.dart files in the <name>/web directory

    final deleteResources = Directory('$name/web').listSync();

    for (final file in deleteResources) {
      file.deleteSync();
    }

    // create a new index.html file in the <name>/web directory
    final index = File('$name/web/index.html');

    // Write the contents of the index.html file
    index.writeAsStringSync('''
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kitawi is a responsive UI framework for building modern web applications.">
    <meta name="keywords" content="kitawi, ui framework, web development">
    <title>$name</title>
    <style>
      /* Hide scrollbar for all modern browsers except IE */
      .scrollable::-webkit-scrollbar {
        width: 0;
        height: 0;
      }

      /* Hide scrollbar for IE, Edge and Firefox */
      .scrollable {
        -ms-overflow-style: none; /* IE and Edge */
        scrollbar-width: none; /* Firefox */
      }

      /* Hide scrollbar thumb */
      .scrollable::-webkit-scrollbar-thumb {
        background-color: rgba(0, 0, 0, 0);
        width: 0;
        height: 0;
      }
    </style>
  </head>
  <body>
    <div id="root"></div>
    <script src="main.dart.js"></script>
  </body>
</html>
''');

// create new main.dart file in the <name>/web directory
    final main = File('$name/web/main.dart');

    // Write the contents of the main.dart file
    main.writeAsStringSync('''
import 'package:kitawi/kitawi.dart';

/// This is the entry point of the app.
void main() {

  /// This is the root element of the app.
  /// [run] takes id of the root element as an argument.
  /// The default id is 'root'.
  start(
    () => run(MyApp(), id: 'output'),
  );
}

class Clock {
  final int? hour;
  final int? minute;
  final int? second;

  Clock({this.hour, this.minute, this.second});

  @override
  String toString() {
    return '\$hour:\$minute:\$second';
  }
}

/// This is the main widget of the app.
class MyApp extends Kitawi {

  /// This is a stream of [Clock] objects.
  /// It is used to update the time every second.
  Stream<Clock> clock() async* {
    int hour = 0;
    int minute = 0;
    int second = 0;
    while (true) {
      await Future.delayed(Duration(seconds: 1));

      if (second - 1 == 60) {
        second = 0;
        minute++;
      }

      if (minute - 1 == 60) {
        minute = 0;
        hour++;
      }

      if (hour - 1 == 24) {
        hour = 0;
      }
      yield Clock(hour: hour, minute: minute, second: second++);
    }
  }

/// This is the build method of the app.
/// It returns a [Scaffold] widget.
  @override
  Widget build() {
    return Scaffold(
      body: Container(
        height: 100.percent,
        width: 100.percent,
        alignment: Alignment.center,
        decoration: Decoration(
          color: Theme.mode == ThemeMode.dark ? Colors.white : Colors.black,
        ),
        child: StreamBuilder<Clock>(
          stream: clock(),
          initialData: Clock(hour: 0, minute: 0, second: 0),
          builder: (snapshot) {
            return Text(
              snapshot.data.toString(),
              style: TextStyle(fontSize: 30),
            );
          },
          errorWidgetBuilder: (error) => Text(
            error.toString(),
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
''');
  } catch (e) {
    print(e.toString());
  }
}
