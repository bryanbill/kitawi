import 'dart:convert';
import 'dart:io';

void main(List<String?> args) async {
  String? command;
  List<String?> rest;

  try {
    command = args.first;
    rest = args.sublist(1);
  } catch (e) {
    printHelp();
    return;
  }

  switch (command) {
    case 'new':
      newProject(rest.isNotEmpty ? rest.first : null);
      break;
    case 'get':
      getPackages(rest);
      break;

    case 'run':
      runProject(rest);
      break;
    case 'build':
      _build();
      break;
    case 'version':
      print('Kitawi version 0.2.1');
      break;
    default:
      printHelp();
      break;
  }
}

Future<void> newProject(String? projectName) async {
  while (projectName == null || projectName.isEmpty) {
    print('Enter the project name');
    projectName = stdin.readLineSync();
    if (projectName == null || projectName.isEmpty) {
      print('Please enter a valid project name.');
    }
  }

  // Check if Git is installed.
  if (!await _isGitInstalled()) {
    print('Error: Git is not installed.');
    return;
  }

  // Check if Dart is installed.
  if (!await _isDartInstalled()) {
    print('Error: Dart is not installed.');
    return;
  }
  // Create the project folder.
  var projectDir = Directory(projectName);
  if (await projectDir.exists()) {
    print('Error: A directory with the name "$projectName" already exists.');
    return;
  }
  await projectDir.create();

  var result = await Process.run('git', [
    'clone',
    'https://github.com/kitawee/template',
    projectName,
  ]);
  if (result.exitCode != 0) {
    print('Error: Failed to clone the template repository.');
    print(result.stderr);
    return;
  }
  // Clear the .git folder.
  var gitDir = Directory('$projectName/.git');
  if (await gitDir.exists()) {
    await gitDir.delete(recursive: true);
  }

  // update the project name in the pubspec.yaml file
  var pubspecFile = File('$projectName/pubspec.yaml');
  var pubspecContent = await pubspecFile.readAsString();

  pubspecContent = pubspecContent.replaceAll('template', projectName);
  await pubspecFile.writeAsString(pubspecContent);

  print('Project "$projectName" created successfully.');
}

Future<bool> _isGitInstalled() async {
  try {
    await Process.run('git', ['--version']);
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> _isDartInstalled() async {
  try {
    await Process.run('dart', ['--version']);
    return true;
  } catch (e) {
    return false;
  }
}

Future<void> getPackages(List<String?> args) async {
  if (args.isEmpty) {
    var result = await Process.run('dart', ['pub', 'get']);
    print(result.stdout);
    print(result.stderr);
    return;
  }

  var result = await Process.run('dart', [
    'pub',
    'add',
    ...args as List<String>,
  ]);
  print(result.stdout);
  print(result.stderr);
}

Future<void> runProject(List<String?>? rest) async {
  var result = await Process.run('dart', [
    'pub',
    'global',
    'activate',
    'webdev',
  ]);
  print(result.stderr);

  // get port from --port flag
  var port = '3000';

  if (rest != null && rest.isNotEmpty) {
    var portIndex = rest.indexOf('--port');
    if (portIndex != -1 && portIndex + 1 < rest.length) {
      port = rest[portIndex + 1]!;
    }
  }

  //run the project
  var process = await Process.start('webdev', [
    'serve',
    'web:$port',
    '--auto',
    'refresh',
    '--hostname',
    '0.0.0.0',
  ]);

  process.stdout.listen((event) {
    stdout.add(event);
  });

  process.stderr.listen((event) {
    stderr.add(event);
  });

  // Wait for the process to finish.
  await process.exitCode;

  // Stop the process when the user presses Enter.
  await stdin.first;
  process.kill();
}

Future<void> _build() async {
  try {
    var config = File('./config.json');
    List<String> includes = [];
    String sourceDir = "web";
    String directoryName = "build";

    if (!await config.exists()) {
      print("Config file not found. Using default configuration.");
    } else {
      var content = await config.readAsString();
      var configJSON = jsonDecode(content) as Map<String, dynamic>;

      if (configJSON['buildDir'] != null) {
        directoryName = configJSON['buildDir'];
      }

      includes = List<String>.from(configJSON['include']);
      if (configJSON['sourceDir'] != null) {
        sourceDir = configJSON['sourceDir'];
      }
    }

    final directory = Directory(directoryName);
    if (!await directory.exists()) {
      await directory.create();
    }

    await Process.run('cp', ['-r', ...includes, directoryName]);

    //wasm
    var result = await Process.run('dart', [
      'compile',
      'wasm',
      '$sourceDir/main.dart',
      '-o',
      '${directory.path}/main.wasm',
    ]);

    print(result.stdout);
    print(result.stderr);

    //js
    var jsResult = await Process.run('dart', [
      'compile',
      'js',
      '$sourceDir/main.dart',
      '-o',
      '${directory.path}/main.js',
    ]);

    print(jsResult.stdout);
    print(jsResult.stderr);

    print("Project built successfully.");

    exit(0);
  } catch (err) {
    print("Error: $err");
    exit(1);
  }
}

void printHelp() {
  print('''
  Usage: kitawi <command> [arguments]

  Commands:
    new <project-name>    Create a new project.
    get [package-names]   Get packages.
    run                   Run the project.
    build                 Build the project.
    version               Print the version of the tool.
    help                  Print this help message.
  ''');
}
