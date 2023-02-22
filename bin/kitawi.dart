#!/usr/bin/env dart

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
        await run(port);
      }
    }
  } catch (e) {
    print(e.toString());
    print(parser.usage);
    exit(1);
  }
}

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
      contents.replaceFirst('dependencies:', 'dependencies:\n  kitawi: ^0.0.1');

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

Future<void> run(int port) async {
  // Run webdev serve
  final webdev = await Process.start('webdev', ['serve', 'web:$port']);

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
