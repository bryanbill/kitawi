import 'dart:io';

import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Show usage information')
    ..addCommand('run', _runCommandParser())
    ..addCommand('create', _createCommandParser())
    ..addCommand('build', _buildCommandParser());

  ArgResults argResults;
  try {
    argResults = parser.parse(arguments);
  } on FormatException catch (e) {
    print(e.message);
    print('');
    printUsage(parser);
    return;
  }

  if (argResults['help'] || argResults.command == null) {
    printUsage(parser);
    return;
  }

  final commandName = argResults.command!.name;
  switch (commandName) {
    case 'run':
      _handleRunCommand(argResults.command!);
      break;
    case 'create':
      _handleCreateCommand(argResults.command!);
      break;
    case 'build':
      _handleBuildCommand(argResults.command!);
      break;
    default:
      printUsage(parser);
      break;
  }
}

void printUsage(ArgParser parser) {
  print('Usage: kitawi <command> [arguments]\n');
  print('Commands:');
  print('  run    : Run a Kitawi application');
  print('  create : Create a new Kitawi project');
  print('  build  : Build a Kitawi project into an executable\n');
  print(parser.usage);
}

ArgParser _runCommandParser() {
  final parser = ArgParser();
  parser.addOption('port', abbr: 'p', help: 'The port number to listen on');
  return parser;
}

void _handleRunCommand(ArgResults args) async {
  final port = args['port'] ?? 8080;

  final webdev = await Process.start('webdev',
      ['serve', 'web:$port', '--hostname', '0.0.0.0', '--auto', 'refresh']);

  webdev.stdout.listen((event) {
    stdout.add(event);
  });

  webdev.stderr.listen((event) {
    stderr.add(event);
  });

  await webdev.exitCode;
}

ArgParser _createCommandParser() {
  final parser = ArgParser();
  return parser;
}

void _handleCreateCommand(ArgResults args) async {
  final appName = args.rest.first;

  final git = await Process.start('git', [
    'clone',
    'https://github.com/bryanbill/kt_template.git',
    appName,
  ]);

  git.stdout.listen((event) {
    stdout.add(event);
  });
  git.stderr.listen((event) {
    stderr.add(event);
  });

  await git.exitCode;

  final rm = await Process.start('rm', ['-rf', '$appName/.git']);

  rm.stdout.listen((event) {
    stdout.add(event);
  });

  rm.stderr.listen((event) {
    stderr.add(event);
  });

  await rm.exitCode;
}

ArgParser _buildCommandParser() {
  final parser = ArgParser();

  return parser;
}

void _handleBuildCommand(ArgResults args) async {
  var process = await Process.start('webdev', ['build']);

  process.stdout.listen((event) {
    stdout.add(event);
  });

  process.stderr.listen((event) {
    stderr.add(event);
  });

  await process.exitCode;
}
