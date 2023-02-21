#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

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
      print('No command specified');
      exit(1);
    } else {
      if (results.command?.name == 'create') {
        await create(results['name']);
      }

      if (results.command?.name == 'run') {
        final port = int.parse(results['port']);
        await buildAndServe(port);
      }
    }
  } catch (e) {
    print(e.toString());
    print(parser.usage);
    exit(1);
  }
}

Future<void> create(String? name) async {
  // create the directory [name] in the current directory
  final dir = Directory(name!);
  if (await dir.exists()) {
    print('Directory $name already exists');
    exit(1);
  }

  await dir.create();

  // create the pubspec.yaml file
  final pubspec = File('${dir.path}/pubspec.yaml');
  await pubspec.create();

  // write the pubspec.yaml file
  await pubspec.writeAsString('''
name: $name
description: A new Kitawi app.
version: 1.0.0
environment:
  sdk: '>=2.12.0 <3.0.0'
dependencies:
  kitawi: any
dev_dependencies:
  test: any
''');

  // create the lib directory
  final lib = Directory('${dir.path}/lib');
  await lib.create();

  // create the main.dart file
  final main = File('${lib.path}/main.dart');
  await main.create();

  // write the main.dart file
  await main.writeAsString('''
import 'package:kitawi/kitawi.dart';

void main() {
  start((){
    run(Container(
      height: Size().height,
      width: Size().width,
      alignment: Alignment.center,
      child: Text('Welcome to Kitawi!'),
    ));
  });
}

''');

  // create the test directory
  final test = Directory('${dir.path}/test');
  await test.create();

  // create the main_test.dart file
  final mainTest = File('${test.path}/main_test.dart');
  await mainTest.create();

  // write the main_test.dart file
  await mainTest.writeAsString('''
import 'package:test/test.dart';

void main() {
  test('test', () {
    expect(true, true);
  });

}

''');

// create the build directory
  final build = Directory('${dir.path}/build');
  await build.create();

  // create the index.html file
  final index = File('${build.path}/index.html');
  await index.create();

  // write the index.html file
  await index.writeAsString('''
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title id="title">$name</title>
    <style>
      html,
      body {
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="root"></div>
    <script src="js/kitawi.js"></script>
  </body>
</html>
''');

  print('''
Created $name
To run your app:
  cd $name
  kitawi get
  kitawi run
''');
}

Future<void> buildAndServe(int port) async {
  // run the build command
  final build = await Process.run(
      'dart', ['compile', 'js', 'lib/main.dart', '-o', 'build/js/kitawi.js']);
  print(build.stdout);
  print(build.stderr);

  // listens for input from the user in the terminal
  final input = stdin.transform(utf8.decoder).transform(const LineSplitter());

  // listen for the user to type 'q' to quit
  input.listen((String line) {
    if (line == 'q') {
      exit(0);
    }
  });

  // if input is 'r' then rebuild and serve
  input.listen((String line) async {
    if (line == 'r') {
      await buildAndServe(port);
    }
  });

  // serve the build directory
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
  print('Serving at http://${server.address.host}:${server.port}');
  await for (final request in server) {
    final file = File('build/${request.uri.path}');
    if (await file.exists()) {
      request.response.headers.contentType =
          ContentType.parse(lookupMimeType(file.path));
      await file.openRead().pipe(request.response);
    } else {
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
    }
  }
}

String lookupMimeType(String path) {
  final extension = path.split('.').last;
  switch (extension) {
    case 'html':
      return 'text/html';
    case 'js':
      return 'application/javascript';
    case 'css':
      return 'text/css';
    default:
      return 'text/plain';
  }
}
